# Super Storage Fix Summary

## Problem Description

Two critical storage-related bugs were identified in the `super` script:

### Bug 1: Incorrect Available Storage Detection
- **Issue**: `NSURLVolumeAvailableCapacityForImportantUsageKey` was incorrectly reporting 0 GB of available storage despite ample free space
- **Impact**: Users received false "insufficient storage" alerts when plenty of space was available
- **Root Cause**: Apple's `NSURLVolumeAvailableCapacityForImportantUsageKey` can return 0 in certain edge cases

### Bug 2: Incorrect Required Storage Calculation (85TB Bug)
- **Issue**: MSU (Minor/Major) updates were showing ridiculously large storage requirements (e.g., 85,317 GB = ~85TB)
- **Impact**: Users received false "insufficient storage" alerts with impossible storage requirements
- **Root Cause**: Inconsistent byte-to-GB conversion between different update types

## Root Cause Analysis

### Bug 1: Available Storage Detection
The script used `NSURLVolumeAvailableCapacityForImportantUsageKey` which can return 0 in edge cases, while `NSURLVolumeAvailableCapacityKey` provides more reliable results.

### Bug 2: Required Storage Calculation
The script used different divisors for different update types:
- **macOS Installer updates**: `/1000000000` (correct - converts bytes to GB)
- **MSU updates**: `/1000000` (buggy - converts bytes to MB, then treated as GB)

This caused MSU updates to be calculated as 1000x larger than they should be.

## Implemented Solution

### Fix 1: Robust Available Storage Detection
Added a multi-stage fallback mechanism in the `check_storage_available()` function:

1. **Primary**: `NSURLVolumeAvailableCapacityForImportantUsageKey`
2. **Fallback 1**: `NSURLVolumeAvailableCapacityKey` 
3. **Fallback 2**: `df -g /` command
4. **Fallback 3**: `system_profiler SPStorageDataType`

### Fix 2: Consistent Storage Size Calculation
Updated both MSU size calculations to use the correct divisor:

**Before (buggy):**
```bash
# Line 6564 (major upgrade)
macos_msu_size=$(echo "${macos_msu_major_upgrade_target}" | awk -F ',' '{print $3}' | sed -e 's/.*://g' -e 's/[^0-9]//g' | awk '{print $1"/1000000 +1"}' | bc)

# Line 6599 (minor update)  
macos_msu_size=$(echo "${macos_msu_minor_update_target}" | awk -F ',' '{print $3}' | sed -e 's/.*://g' -e 's/[^0-9]//g' | awk '{print $1"/1000000 +1"}' | bc)
```

**After (fixed):**
```bash
# Line 6564 (major upgrade)
macos_msu_size=$(echo "${macos_msu_major_upgrade_target}" | awk -F ',' '{print $3}' | sed -e 's/.*://g' -e 's/[^0-9]//g' | awk '{print $1"/1000000000 +1"}' | bc)

# Line 6599 (minor update)
macos_msu_size=$(echo "${macos_msu_minor_update_target}" | awk -F ',' '{print $3}' | sed -e 's/.*://g' -e 's/[^0-9]//g' | awk '{print $1"/1000000000 +1"}' | bc)
```

## Code Changes

### Modified Function: `check_storage_available()`
**Location**: Around line 4382

**Added fallback logic**:
```bash
# Fallback mechanism for when NSURLVolumeAvailableCapacityForImportantUsageKey fails or returns 0
if [[ "${storage_available_gigabytes}" == "0" ]] || [[ -z "${storage_available_gigabytes}" ]] || [[ ! "${storage_available_gigabytes}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
    if [[ "${current_user_account_name}" != "FALSE" ]]; then
        log_super "Warning: NSURLVolumeAvailableCapacityForImportantUsageKey returned ${storage_available_gigabytes}, trying fallback methods..."
        
        # Try NSURLVolumeAvailableCapacityKey as first fallback
        storage_available_gigabytes=$(osascript -l 'JavaScript' -e "ObjC.import('Foundation'); var freeSpaceBytesRef=Ref(); $.NSURL.fileURLWithPath('/').getResourceValueForKeyError(freeSpaceBytesRef, 'NSURLVolumeAvailableCapacityKey', null); Math.round(ObjC.unwrap(freeSpaceBytesRef[0]) / 1000000000)")
        
        # If still 0 or empty, try df command as second fallback
        if [[ "${storage_available_gigabytes}" == "0" ]] || [[ -z "${storage_available_gigabytes}" ]] || [[ ! "${storage_available_gigabytes}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
            storage_available_gigabytes=$(df -g / | tail -1 | awk '{print $4}')
        fi
        
        # If still 0 or empty, try system_profiler as final fallback
        if [[ "${storage_available_gigabytes}" == "0" ]] || [[ -z "${storage_available_gigabytes}" ]] || [[ ! "${storage_available_gigabytes}" =~ ${REGEX_ANY_WHOLE_NUMBER} ]]; then
            storage_available_gigabytes=$(system_profiler SPStorageDataType -json | grep -A 10 -B 5 "Available" | grep "Available" | head -1 | awk -F '"' '{print $4}' | sed 's/\.[0-9]*//')
        fi
    fi
fi
```

### Modified Lines: Storage Size Calculations
**Lines 6564 and 6599**: Changed divisor from `/1000000` to `/1000000000`

## Benefits

1. **Reliable Storage Detection**: Multiple fallback methods ensure accurate available storage detection
2. **Correct Size Calculations**: All update types now use consistent byte-to-GB conversion
3. **Eliminates False Alerts**: Users will no longer see impossible storage requirements or false insufficient storage warnings
4. **Backward Compatible**: Existing functionality preserved while adding robustness

## Testing

The fixes have been tested and verified:
- ✅ Available storage detection works with multiple fallback methods
- ✅ Storage size calculations now use consistent GB conversion
- ✅ 85GB update now correctly shows as 85GB instead of 85,000GB
- ✅ All testing code and settings have been reverted

## Files Modified

1. **`super`**: Main script with both fixes applied
2. **`super.checksum.txt`**: Updated checksum for integrity verification
3. **`STORAGE_FIX_SUMMARY.md`**: This documentation file

## Checksum

Updated checksum: `47d58fc63dab7e47e2639a053353050785af0e7bb164b47eb3032328d75c8cbb`

## Impact

These fixes resolve two critical bugs that were causing:
- False "insufficient storage" alerts when plenty of space was available
- Impossible storage requirements (like 85TB) for normal macOS updates
- User confusion and potential workflow interruptions

The fixes ensure reliable storage detection and accurate size calculations across all update types. 