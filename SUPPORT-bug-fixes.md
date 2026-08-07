# Patched `super` bug fixes (IT admin view)

**Audience:** Mac / MDM admins (Jamf, Mosyle, etc.)  
**Build:** local **`5.1.1-p19`** (folder name `super-5.1.1-p01` is historical)  
**Based on:** upstream Macjutsu [super v5.1.1](https://github.com/Macjutsu/super/releases)  
**Engineer detail:** [PATCHES-vs-upstream-5.1.1.md](PATCHES-vs-upstream-5.1.1.md)

This note describes **what was broken in stock 5.1.1 for real fleets**, how it shows up in the field, and what each local fix changes. Same install path, LaunchDaemon, and `com.macjutsu.super` prefs unless noted.

Confirm the build:

```bash
sudo /Library/Management/super/super --version
# expect: 5.1.1-p19
```

Also look for `5.1.1-p19` in `/Library/Management/super/logs/super.log`.

---

## Free space looked OK — Apple still fails the install (p14 + p17 + p18 + p19)

**Symptom**

- Workflow proceeds on free-space checks
- Later: not enough free disk space during prepare/install (common with larger Tahoe OTAs)

**What went wrong**

Upstream floors (15 GB / 25 GB) and size-based undercuts were too low for real OTA prepare needs; install-time SPACE failures were easy to miss. Even with higher floors, a small listed download size did not reflect Apple’s snapshot prepare budget (~14 GB observed).

**Fix**

- **p14:** Higher default floors (~**25 GB** minors / **35 GB** majors); floors not undercut by a small reported download size; clearer install-time SPACE detection
- **p17:** Size-aware formula (listed × multiplier with soft mins); **safe floor 25/35 when Apple’s prepare size is not yet seen**; when Apple logs `snapshot prepare size` during this run, proceed gates use `max(formula, apple_gb)` instead of always forcing 25/35; blocks restart-capable install/MDM actions before they start if free space is still too low; residual skip of restart notify after prepare if space collapsed (reboot may already be owned — not a full cancel)
- **p18:** Residual skip-notify/audit also covers **MDM UPDATE/UPGRADE** success paths (not only installer mid-watch); Apple prepare stream cleaned on SIGTERM/HUP; safer max-file handling
- **p19:** Hardens Apple prepare capture: **mkdir lock** on max-file updates (no lost higher max under concurrent writers); **parent-tracked tail + FIFO** (no orphan `tail -F`); stop order **reap then sync-parse** so only one writer remains

---

## Failed to queue → false “completed” (p16)

**Symptom**

- `msu-workflow.log`: download / `Restarting…` then Apple **`Failed to queue update and restart`**
- After reboot, audit still says **All available … updates/upgrades completed!**
- Mac stays on the old OS (e.g. still 26.5.2 when the target was 26.6)

**What went wrong**

Stock treated the queue failure as a successful prepare, set restart-validation, and after reboot (no remaining targets) declared everything done.

**Fix**

- **Failed to queue** is an install failure (error deferral / retry), not success
- Restart validation checks that the OS **build changed**; if not, it retries instead of marking complete

---

## MDM deferred a newer minor; older SU still installed (p16)

**Symptom**

- MDM Restrictions: newer patch **Deferred: YES** (e.g. 26.6.1)
- `softwareupdate` still lists an **older** installable minor (e.g. 26.6)
- Install of the older one often hits Failed to queue / repeated churn

**What went wrong**

`super` only followed what `softwareupdate` offered. It did not notice that MDM already knew about a newer same-major update that was deferred.

**Fix**

- If MDM shows a **newer same-major** `MSU_UPDATE` as **Deferred YES**, wait — do not install the older SU target
- Does not fall through to a full installer as a workaround
- Exact pin matching the SU target (e.g. pin `26.6`) still keeps that target

**Ops note:** Lift or shorten the Restrictions deferral when you want the newer build; until then, waiting avoids burning cycles on the older one.

---

## Downloads reset on relaunch, or incomplete looks “done” (p01 / p02 / p12)

**Symptom**

- Large macOS downloads restart from scratch when `super` relaunches
- Or: workflow treats a download as finished when it was not

**What went wrong**

Startup always killed in-progress downloads; success gating could mark incomplete work complete.

**Fix**

- Keeps a **healthy in-progress** download across relaunch (hung downloads still cleaned up)
- Can attach/resume monitoring of an existing download
- Marks complete only when all success checks pass

---

## Schedules and deadlines miss the configured window (p08–p10 / p13)

**Symptom**

- Maintenance windows / days-away / scheduled install off by a day, or pick the **latest** window instead of the **soonest**
- A **days**-based deadline does not override the schedule the way a date deadline does
- Deferral counts look wrong while a download is still running

**What went wrong**

Weekday and end-of-day math bugs; wrong window sort; days-deadline status ignored vs schedule; deferral counter edge case during download.

**Fix**

- Correct weekday / end-of-day / “past end of today’s window” handling
- `scheduled_install_days=0` → **soonest** allowed window that day
- Past-due **days** deadlines override active schedule windows
- Deferral counters stay consistent while download is still required

---

## “No updates” treated as an error; or listing hangs (p05 / p01 / p12)

**Symptom**

- Hosts error-defer (~hour) when Apple correctly reports nothing installable
- Or: agent appears stuck while listing updates

**What went wrong**

Empty/successful “no new software” was treated like a list failure; list helpers could wait indefinitely; empty `mdmclient` had weak fallback.

**Fix**

- Successful “no new software” → clean **Status**, not error deferral
- Falls back to `softwareupdate --list` when `mdmclient` is empty
- Hard timeouts on list helpers so a hung list cannot block forever

---

## MDM download-only never finishes (p07 / p12)

**Symptom**

- Download-only MDM workflow sits near 100% until timeout even when assets look ready

**What went wrong**

Workflow waited for a stash event that often never arrives on modern macOS.

**Fix**

Near the end of prepare, polls update assets and exits the wait instead of hanging.

---

## Dialogs / helpers fail open; test mode can still reboot (p11 / p06)

**Symptom**

- IBM Notifier crash or missing helper → workflow continues as if the user made no pending choice
- `--test-mode` still reboots a no-user Mac on some restart-without-updates paths

**What went wrong**

Unexpected Notifier exits had no safe default; helper validity could look “valid” when unset; test-mode reboot skip was incomplete.

**Fix**

- Unexpected user/schedule dialog exits → defer
- Helper validity defaults fail closed
- Test mode skips the real reboot on those no-user restart paths

---

## Optional control (only new admin-facing option)

| Situation | Stock 5.1.1 | This build |
|---|---|---|
| Automatic Download on, minor not downloaded yet | Always defers and waits on Apple’s background download | Same **by default** |
| Want `super` to drive the download | Not available | **`WorkflowMacOSMinorAutoDownloadDeferral`** = **FALSE** (or `--workflow-macos-minor-auto-download-deferral-off`) |

p16 Failed-to-queue / deferred-wait / land-check behavior needs **no** new MDM keys.

---

## What stays the same

- Install: run `super` as root from **outside** `/Library/Management/super/`
- Prefs domain: **`com.macjutsu.super`**
- Same wiki concepts: deferrals, deadlines, auth, dialogs ([Macjutsu wiki](https://github.com/Macjutsu/super/wiki))
- Upstream [CHANGELOG](https://github.com/Macjutsu/super/blob/main/CHANGELOG.md) = product history; this doc = **local** deltas only

---

## Log phrases → which fix

| In `super.log` / `msu-workflow.log` | Related fix |
|---|---|
| `Failed to queue update and restart` then later **All … completed!** | p16 (queue failure + land check) |
| MDM Deferred **YES** on a newer minor + install of older SU label | p16 (deferred wait) |
| Not enough free disk space after workflow already started | p14 / p17 / p18 / p19 |
| Download restarts every relaunch | p02 / p12 |
| Error deferral when Apple says no new software | p05 |

---

## Related files

| File | Role |
|---|---|
| [PATCHES-vs-upstream-5.1.1.md](PATCHES-vs-upstream-5.1.1.md) | Full technical patch catalog |
| [CHANGELOG.md](CHANGELOG.md) | Upstream product history |
| `super.checksum.txt` | SHA-256 of the local `super` script |

---

*Local build **5.1.1-p19** (2026-08-07). Re-check this note if upstream ships equivalent fixes in a later official release.*
