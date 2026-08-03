# Local `super` changes vs upstream Macjutsu/super 5.1.1

**Purpose:** Describe every local change in this fork relative to stock Macjutsu **v5.1.1**, so a reviewer can understand *what* changed, *why*, and *how to find it in the script*. This is the patch catalog for the local build — not upstream release notes.

**Generated:** 2026-08-03 (verified against live script)  
**Local file:** `super` (directory name `super-5.1.1-p01` is historical; the build ID is **p15**)  
**Local identity:** `SUPER_VERSION="5.1.1-p15"` · `SUPER_DATE="2026/08/03"`  
**Upstream:** [Macjutsu/super](https://github.com/Macjutsu/super) `main` / tag [`v5.1.1`](https://github.com/Macjutsu/super/releases)  
**Upstream identity:** `SUPER_VERSION="5.1.1"` · `SUPER_DATE="2026/07/21"`

## Summary

| | Upstream 5.1.1 | Local 5.1.1-p15 |
|---|---|---|
| Lines | 11,403 | 11,993 |
| Diff size | — | local fork on 5.1.1 (+p01–p15 markers) |
| Patch markers | none | see **Marker conventions** below |

Local work is a **forked patch series on top of stock 5.1.1**, not a rebase onto a newer upstream release. Upstream `main` at comparison time still matches tagged **v5.1.1** (2026-07-21). Patch numbers (`p01`…`p15`) are chronological local notes, not upstream release tags.

**p04** was never used (number skipped). **p15** is a marker/docs pass: in-script `#>>> LOCAL PATCH (p13)` wrappers were added for previously unmarked schedule/deadline fixes; no behavioral change beyond the version string.

### Marker conventions

Find patches with:

```bash
rg 'LOCAL PATCH \(p' super
```

| Form | Meaning |
|---|---|
| `#>>> LOCAL PATCH (pNN): …` … `#<<< END LOCAL PATCH (pNN)` | Normal block (most changes) |
| `#>>> LOCAL PATCH (p07/p12): …` … `#<<< END LOCAL PATCH (p07/p12)` | One block credited to two patch notes (MDM DOWNLOAD_ONLY asset poll) |
| `#>> LOCAL PATCH (p01): …` (single line, no `END`) | Short inline annotations in the softwareupdate-fallback path (five sites). Same p01 work; format is incomplete vs the paired style |

There is **no** `#>>> LOCAL PATCH (p15)` block — p15 only bumps `SUPER_VERSION` / `SUPER_DATE` and added the p13 wrappers.

---

## Patch catalog (all changes)

| Patch | Marker | Changes |
|---|---|---|
| **p01** | in-script (+ usage docs) | `--workflow-macos-minor-auto-download-deferral` CLI/MDM/prefs + `--usage` docs; AutomaticCheck→`msu_automatic_check` fix; hard-timeout list polling in `get_mdmclient_list` / `get_msu_list` / `get_macos_installers_list`; `softwareupdate` fallback when mdmclient empty; installer-list var typo fix; download watch rewrite; MSU download success **AND**; SIGINT handler + trap; Notifier FIFO timeout |
| **p02** | in-script | Download PID helpers; `download_macos_msu` attach/resume before START; kill real `--download` on timeout |
| **p03** | in-script | Keep deferral-restrictions MD5 when `applicationaccess.plist` exists but has no deferral keys |
| **p05** | in-script | Trust successful empty `softwareupdate --list` as “no updates” (not error deferral) |
| **p06** | in-script | mist installer download success **AND**; `--test-mode` skips no-user `shutdown -r` for restart-without-updates |
| **p07** | in-script as `p07/p12` | MDM DOWNLOAD_ONLY: at ≥98% poll `update-asset-attributes` up to 120s (often no `PREPARED_COMMITTING_STASH`) |
| **p08** | in-script | Recompute weekday each reverse day in deadline/scheduled-install ↔ `ScheduleWorkflowActive` loops |
| **p09** | in-script | Parse SOFA `ReleaseDate` as UTC (Zulu), store local `YYYY-MM-DD:HH:MM` |
| **p10** | in-script | `scheduled_install_days=0` → soonest workflow-active window (`sort \| head -1`) |
| **p11** | in-script | Default `ibm_notifier_valid` / `mist_cli_valid` to `FALSE`; unexpected Notifier exit → defer (user/schedule) or log+continue (install/reminder/soft) |
| **p12** | in-script (overlaps p01/p02/p07) | Preserve `--download` at startup only with recent log progress; bound post-marker list waits; label-scoped PID match (no cross-download fallback); pairs with p07 MDM asset poll |
| **p13** | in-script | Schedule past-end same-day → `+7d`; `23:23:59`→`23:59:59` (2× `days_away`); deadline days/date status `\|\|` fix; deferral-count `else` when download still required |
| **p14** | in-script | Storage floors 15→25 / 25→35 GB; remove `macos_msu_size*2` undercut; install-time SPACE detect + log |
| **p15** | version bump only | `SUPER_VERSION`/`SUPER_DATE` → `5.1.1-p15` / `2026/08/03`; add in-script **p13** markers (behavior unchanged from p14 aside from version) |

---

## 1. Version (**p15**) and usage docs (**p01**)

- **[p15]** Version string: `5.1.1` → **`5.1.1-p15`** (logs, `--version`, user-agent); date `2026/07/21` → **`2026/08/03`**
- **[p01]** `--usage` / help MDM key list: documents `--workflow-macos-minor-auto-download-deferral` and `WorkflowMacOSMinorAutoDownloadDeferral`

Treat **`5.1.1-p15`** as the authoritative build ID (`SUPER_VERSION` / `--version` / logs). The folder name `super-5.1.1-p01` does not change with later patch numbers.

---

## 2. New option: minor auto-download deferral (**p01**)

**Problem:** Upstream always auto-defers macOS **minor** updates when System Settings Automatic Download is on and the update is not yet downloaded. That waits for Apple’s background download instead of letting `super` drive `softwareupdate --download`. There was no way to turn that deferral off.

**Change:** Local adds an explicit toggle managed like other workflow prefs (MDM managed → CLI → local plist → default):

| Surface | Value |
|---|---|
| CLI on | `--workflow-macos-minor-auto-download-deferral` |
| CLI off | `--workflow-macos-minor-auto-download-deferral-off` |
| MDM / prefs key | `WorkflowMacOSMinorAutoDownloadDeferral` |
| Default if unset | **`TRUE`** (same deferral behavior as upstream) |

Logic lives in `workflow_check_download_status()`. When the option is **`FALSE`**:

- Forces `macos_msu_automatic_download_deferral="FALSE"`
- Clears the “ramped, not downloadable” deferral path (`macos_msu_automatic_download_ramped="FALSE"`)

…so minor updates proceed to immediate download attempts under `super`’s control.

**When to use `FALSE`:** You want `super` to download/prepare minors itself (faster / more predictable) rather than waiting for Apple’s automatic download + deferral loop.

**Review note:** Default `TRUE` means existing deployments keep upstream behavior unless they opt out.

---

## 3. Storage requirements (**p14**)

These changes address false “enough free space” decisions that later failed when Apple actually prepared/installed the update.

### Default floors

| Constant | Upstream | Local |
|---|---|---|
| `STORAGE_REQUIRED_UPDATE_DEFAULT_GB` | 15 | **25** |
| `STORAGE_REQUIRED_UPGRADE_DEFAULT_GB` | 25 | **35** |

Used as the baseline required free space for minor updates and major upgrades before adding any still-needed download size. Raised because small OTA *download* sizes were undercutting Apple’s real install need (~19 GB observed for Tahoe 26.6).

### Removed `macos_msu_size * 2` undercut

Upstream replaces the minor-update floor when reported download size is &lt; 5 GB:

```bash
{ [[ -z "${test_storage_update_option}" ]] && [[ $macos_msu_size -lt 5 ]]; } && storage_required_update_gb=$((macos_msu_size * 2))
```

Example failure mode: a ~4 GB reported OTA made required space ~8 GB, so `super` allowed the workflow; Apple then failed needing ~19 GB. Local **deletes that assignment** (empty marker comments remain at the old site) so the raised floor stays in force.

### Install-time disk-space failures

Upstream already handled log line `Not enough free disk space` on the **download** watch path. Local also:

1. Detects that string during the **install** log watch → `install_macos_msu_start_error="SPACE"`
2. Adds a SPACE branch in install failure logging

**Known leftover:** the install SPACE log text still says “to **download**…” (copied from the download handler). Behavior/routing is correct; wording is not install-specific.

Without (1)–(2), install-time SPACE failures fell into a generic install-failed path and were harder to diagnose/retry correctly.

---

## 4. Process / download management (**p01**, **p02**, **p12**)

These changes keep downloads alive across relaunches, avoid killing the wrong process, and stop incomplete downloads from being marked complete.

### SIGINT handler (**p01**)

New `handle_super_interrupt`, trapped in `main` only after prefs/logging are ready:

- Leaves in-progress `softwareupdate` / `mist` alone (so a Ctrl-C does not abort Apple’s prepare mid-flight)
- Sets `NextAutoLaunch` to `FALSE` so the LaunchDaemon does not immediately relaunch into a fight with that leftover process
- Clears Jamf API token / PID file; exits 130

### Helpers (**p02**, refined **p12**)

| Function | Purpose |
|---|---|
| `get_msu_workflow_log_current_session` | Return `msu-workflow.log` content after the latest `DOWNLOAD … SOFTWAREUPDATE START` (for resume seeding) |
| `find_softwareupdate_download_pid` | Find the real `softwareupdate --download` PID; if a label is passed, **never** fall back to a different download (**p12**) |
| `wait_pid_with_timeout` / `wait_for_softwareupdate_exit` | Bounded waits; `kill -9` on timeout |
| `resolve_softwareupdate_download_pid` | Resolve PID after background launch (`$!` is unreliable with pipelines / `launchctl asuser`) |
| `kill_softwareupdate_download` | Kill tracked PID plus any remaining matching `--download` |

### Startup kill policy (**p12**)

Upstream always `killall`’s `softwareupdate` and `mist` when a new `super` instance starts—safe for clean restarts, but destructive if a download/prepare is still making progress.

Local **preserves** an in-progress `--download` only if **all** of:

1. A matching `softwareupdate --download` process exists
2. `msu-workflow.log` was modified within **300 s**
3. That log contains `Downloading` / `Downloaded:` progress

Otherwise hung downloads are killed. (An earlier approach that always preserved downloads left dead jobs forever.)

### `download_macos_msu` rewrite (**p02** + **p01**)

Function grew substantially (~213 → ~350 lines). Before writing a new `DOWNLOAD … START` marker it now:

1. Skips the wait if the target is already prepared
2. **Attaches** to an existing matching `--download` and resumes monitoring (`RESUME` log marker; seeds progress from the prior session via `get_msu_workflow_log_current_session`)
3. Otherwise stops leftover `softwareupdate` processes, then starts a new download

Progress watch still uses a timed `while read` over the workflow log (unlike the list helpers in §5). On timeout/failure it kills via `kill_softwareupdate_download` (real PID), not only pipeline `$!`.

### Download success condition (**p01** / **p06**)

Error flags use `FALSE` = “this failure did not happen.” After the watch loop, upstream’s **final** “download completed” gate used **OR** of those “no error” checks—so *any one* already-`FALSE` flag counted as success and could mark an incomplete download complete:

```bash
# upstream final gate (wrong)
if [[ "${download_macos_msu_start_error}" == "FALSE" ]] \
  || [[ "${download_macos_msu_start_timeout}" == "FALSE" ]] \
  || [[ "${download_macos_msu_timeout_error}" == "FALSE" ]] \
  || [[ "${download_macos_msu_title_error}" == "FALSE" ]] \
  || [[ "${download_macos_msu_validation_error}" == "FALSE" ]]; then
```

Local requires **all** of those to be `FALSE` (**AND**). Same fix for mist installer downloads (**p06**). Local also initializes `*_title_error` / `*_validation_error` to `TRUE` **before** the validation `if`, so they are always defined even when the watch did not succeed (upstream only declared them inside the success branch).

---

## 5. Update discovery / list workflows (**p01**, **p05**, **p12**)

### Hard-timeout log polling (**p01** + **p12**)

Upstream waited on `tail -F | read -t` for list completion. When the child exited oddly, `tail -F` could remain and block the agent.

Replaced inside `get_mdmclient_list`, `get_msu_list`, and `get_macos_installers_list` with a second-by-second `grep` poll, process-alive checks, and a **bounded post-marker wait** so a hung list process cannot block forever (**p12**).

### `softwareupdate` fallback when `mdmclient` is empty (**p01**)

`workflow_check_software_status` normally prefers `mdmclient`. When that reports no updates (including macOS 27+ / no-mdmclient paths), local:

- Falls back to `softwareupdate --list`
- Parses mdmclient product keys only when mdmclient was actually available
- Auto-failovers to user auth when the fallback path has no MDM product keys (needed for Apple silicon enforce without MDM push labels)
- Fixes an upstream typo: installer-list error vars use `get_macos_installers_list_*` instead of `get_mdmclient_list_*`

Several of these fallback sites use single-line `#>> LOCAL PATCH (p01)` comments (no matching `END`); see Marker conventions.

### Trust empty `softwareupdate` list (**p05**)

Upstream treated both a failed list (`msu_list==FALSE`) **and** a successful `No new software available.` as:

`Error: … did not return any available updates` → `workflow_check_software_status_error="TRUE"` → error deferral (often ~60 minutes). That was wrong on systems where `softwareupdate` correctly reports nothing installable while `mdmclient` still lists deferred/uninstallable items (seen on current OS betas).

Local:

| Condition | Result |
|---|---|
| `msu_list==FALSE` | Still **Error** (failed/empty fetch) |
| `No new software available.` **or** no `Label:` after a successful list | **Status: No available macOS software updates** (not an error deferral) |

Also:

- If mdmclient still listed items, logs a **Warning** about the mismatch, then still treats as no installable updates
- If an installer-based major/minor workflow is still possible, **continues** so mist-cli evaluation can run; otherwise returns after updating `LastSuccessfulCheckDate`
- Leaves `macos_msu_major_upgrade` / `macos_msu_minor_update` unset on the empty path so later `-n` gates do not treat the literal `"FALSE"` as a real MSU item

### AutomaticCheck variable bug (**p01**)

When reading Software Update Automatic **Check** prefs (`AutomaticCheckEnabled`), upstream wrote the disabled state into `msu_automatic_download` by mistake. Local writes `msu_automatic_check`. Without this, check-disabled systems could be treated as download-disabled (or the reverse confusion), affecting the minor auto-download deferral path in §2.

---

## 6. Deferrals, schedules, deadlines (**p03**, **p08–p10**, **p13**)

### Deferral restrictions checksum (**p03**)

`DeferralRestrictionsChecksum` caches whether Apple’s restrictions profile (`applicationaccess.plist`) changed, to avoid a full software status check every run.

Upstream sets the checksum to `"0"` whenever no update-deferral keys are found—even if the plist **exists** but simply has no deferral keys—so the cache never sticks and every run does a full check.

Local only zeros the checksum when the plist **file is missing**. (`DeferralRestrictionsCache` is still set to `FALSE` in that branch.)

### Weekday recomputation (**p08**)

When aligning deadlines / scheduled installs to `ScheduleWorkflowActive`, reverse-day loops walk backward looking for a matching weekday window. Upstream computed `deadline_weekday` / `workflow_scheduled_install_weekday` **once** before the loop, so day counters 1–5 never matched later calendar days. Local recomputes the weekday each reverse day.

### `scheduled_install_days=0` (**p10**)

When adjusting a scheduled install onto workflow-active windows and the install is **not** “matches now”:

| | Upstream | Local |
|---|---|---|
| `scheduled_install_days == 0` | Always `sort -r \| head -1` (latest window that day) | `sort \| head -1` (soonest) |
| Other days / date schedules | `sort -r \| head -1` (latest) | unchanged |

`days=0` means “as soon as allowed after zero day,” so picking the latest window delayed installs incorrectly.

### SOFA release date UTC (**p09**)

Automatic zero dates from SOFA `ReleaseDate` (e.g. `2026-07-29T17:00:00Z`) drive deadline/schedule math.

Upstream:

```bash
…ReleaseDate… | sed -e 's/T/:/g' -e 's/:00Z//g'
```

That strips `Z` and treats the remaining fields as **local** wall time (wrong for Zulu stamps). Local parses `%Y-%m-%dT%H:%M:%SZ` with `date -u`, converts to epoch, then stores local `YYYY-MM-DD:HH:MM` (warns if parse fails).

### Schedule / deadline fixes (**p13**, in-script)

These four edits are wrapped with `#>>> LOCAL PATCH (p13)` … `#<<< END LOCAL PATCH (p13)` (markers added in **p15**; logic dates from earlier unmarked work).

1. **End-of-day typo:** `…:23:23:59` → **`…:23:59:59`** in **two** `workflow_scheduled_install_days_away` calculations (scheduled-install adjust path and user-choice adjust path). One site sits next to a **p08** weekday loop; both are the same typo fix. Could skew “days away” near end of day.

2. **Schedule past end of today’s window:** Upstream only queued a next start when past end **and** weekday ≠ today—so an already-ended **today** window was skipped. Local: if past end **and** same weekday → next week (`+7d` from that start); other weekdays still use `+Weekday`.

3. **Deadline days/date status:** When deciding whether a past-due deadline overrides `ScheduleWorkflowActive`, upstream duplicated `deadline_date_status` twice with `&&` (days status never considered):

```bash
# upstream
if [[ "${deadline_date_status}" != "FALSE" ]] && [[ "${deadline_date_status}" != "FALSE" ]]; then
```

Local:

```bash
if [[ "${deadline_days_status}" != "FALSE" ]] || [[ "${deadline_date_status}" != "FALSE" ]]; then
```

So a past-due **days** deadline correctly overrides the active schedule window.

4. **Deferral count while download still required:** For focus / soft / hard **count** deadlines, upstream increments only when downloads are not required (or test mode). If a download is still required, it had **no `else`**, so `deadline_counter_*_current` stayed **unset** while the following `-ge` comparison still ran (unreliable / empty arithmetic).

Local adds:

```bash
else # Download still required: do not increment, but still evaluate the existing counter.
    deadline_counter_*_current="${deadline_counter_*_previous}"
fi
```

The existing counter is evaluated without burning another deferral while the download is unfinished. Functional bug fix, not a comment-only change.

---

## 7. MDM DOWNLOAD_ONLY completion (**p07** / **p12**)

MDM download-only workflows often reach ≥98% prepare progress without emitting `PREPARED_COMMITTING_STASH`, so upstream’s watch could wait until timeout even though assets were effectively ready.

Local, at ≥98% in `DOWNLOAD` phase:

1. Runs once (guarded by local flag `push_macos_mdm_download_asset_poll`)
2. Polls `/System/Volumes/Update/Update` `update-asset-attributes` for up to **120 s**
3. Matches prepared `OSVersion` (+ `ProductVersionExtra` on macOS 13+) to the target version
4. Breaks out of the watch loop (match **or** timeout) so DOWNLOAD_ONLY cannot hang forever

Post-loop validation still decides success vs failure; this only unblocks the watch. Marked in-script as **`p07/p12`** (one paired block).

---

## 8. Helpers and dialogs (**p11**, **p06**, **p01**)

### Fail-closed helper defaults (**p11**)

In `manage_helpers`, install is conditional: `get_*` then `check_*` only if the binary/app appeared. If download/extract fails, `check_*` never runs.

Upstream can leave `ibm_notifier_valid` / `mist_cli_valid` **unset** while later code compares them to `"FALSE"` (unset ≠ `"FALSE"` in `[[ ]]`, so failure can look like success). Local sets both to **`FALSE`** before install/validate (mist default is inside the mist-needed branch).

### Unexpected IBM Notifier exit (**p11**)

Upstream `dialog_user_choice` / schedule dialogs have no `*)` case—crash, missing binary, or odd exit codes fall out of the `case` with no deferral, and the workflow can proceed into cleanup/`reset_workflow` as if nothing was pending.

Local:

| Dialog path | On unexpected exit |
|---|---|
| User-choice / schedule | `*)` → defer with `deferral_timer_error_minutes` |
| Install / reminder / soft-deadline | Log and continue (same intent as timeout); soft deadline remains enforce-forward |

### Test mode + restart without updates (**p06**)

No-user `workflow_restart_without_updates` always called `shutdown -r` upstream, even under `--test-mode`. Local skips the real reboot in test mode (mirrors the active-user install path) so lab runs do not reboot fleets.

### Notifier FIFO read (**p01**)

Upstream blocked on `cat "${fifo}"` waiting for IBM Notifier metrics. If Notifier never writes, `super` hangs until killed. Local uses a 3-second timeout-guarded `read`, then hard kill/wait of the metrics helper, so a stuck Notifier cannot hang the agent indefinitely.

---

## 9. Behavior matrix (practical impact)

| Area | Patch | Upstream 5.1.1 | Local p15 |
|---|---|---|---|
| Minor update auto-download deferral | p01 | Always on when Apple auto-download applies | Optional via `WorkflowMacOSMinorAutoDownloadDeferral` (default on) |
| Free-space floors | p14 | 15 GB / 25 GB | 25 GB / 35 GB; no `size*2` undercut |
| Install SPACE errors | p14 | Download watch only | Download + install watch/logging (log text still says “download”) |
| Hung `tail -F` on **list** helpers | p01+p12 | Possible | Hard-timeout polling in list helpers |
| Empty mdmclient list | p01 | Limited | `softwareupdate` fallback |
| `softwareupdate` “No new software” | p05 | Treated as status **error** | Clean “no updates” Status (unless list fetch failed) |
| Incomplete download marked complete | p01+p06 | Possible (final OR gate) | Fixed (final AND gate) |
| In-progress download on relaunch | p02+p12 | Always killed at startup | Preserved only with recent log progress; attach/resume |
| SIGINT / Ctrl-C | p01 | Default shell behavior | Disable immediate LaunchDaemon relaunch |
| SOFA zero date | p09 | `sed` strip `Z`, treat as local | True UTC→local |
| Schedule weekday counters | p08 | Frozen weekday in reverse loops | Recomputed each day |
| `days=0` window pick | p10 | Latest window | Soonest window |
| Past-end today’s schedule window | p13 | Skipped | Next week `+7d` |
| `23:23:59` days_away typo | p13 | Typo | `23:59:59` |
| Past-due days deadline vs schedule | p13 | Days status ignored | Days or date overrides |
| Count deadline while downloading | p13 | Counter unset → broken compare | Reuse previous counter, no increment |
| MDM DOWNLOAD_ONLY hang | p07/p12 | Wait for missing stash event | Asset poll at ≥98% |
| Notifier crash / missing binary | p11 | No `*)` on user dialogs | Defers (user/schedule) |
| Helper validate after failed get | p11 | Unset can look valid | Fail-closed `FALSE` defaults |
| Test-mode no-user restart | p06 | Could still reboot | Skips reboot |
| Restrictions checksum churn | p03 | Zeroed when keys absent | Zeroed only if plist missing |
| In-script p13 markers | p15 | n/a | Markers added; version `5.1.1-p15` |

---

## 10. References

- Repo: https://github.com/Macjutsu/super  
- Script: https://github.com/Macjutsu/super/blob/main/super  
- Changelog: https://github.com/Macjutsu/super/blob/main/CHANGELOG.md  
