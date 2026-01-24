# Code Coverage Report Summary

## 📊 Overall Coverage Statistics

**Generated Date:** January 24, 2026, 13:26:23

### Summary
- **Line Coverage:** 90.5% (95 out of 105 lines covered)
- **Total Lines:** 105
- **Covered Lines:** 95
- **Uncovered Lines:** 10

## 📁 Directory Coverage Breakdown

### 1. `common/utils/validations/` - ✅ 100.0% Coverage
- **Total Lines:** 46
- **Covered Lines:** 46
- **Status:** Excellent coverage
- **Files:**
  - `edit_text_validation.dart` - 100.0% (46/46 lines)

### 2. `data/` - ✅ 100.0% Coverage
- **Total Lines:** 9
- **Covered Lines:** 9
- **Status:** Excellent coverage
- **Files:**
  - `app_exceptions.dart` - 100.0% (9/9 lines)

### 3. `data/network/` - ✅ 100.0% Coverage
- **Total Lines:** 25
- **Covered Lines:** 25
- **Status:** Excellent coverage
- **Files:**
  - `network_api_service.dart` - 100.0% (25/25 lines)

### 4. `utils/` - ⚠️ 60.0% Coverage
- **Total Lines:** 25
- **Covered Lines:** 15
- **Uncovered Lines:** 10
- **Status:** Needs improvement
- **Files:**
  - `filed_focus_change_service.dart` - ✅ 100.0% (3/3 lines)
  - `utils.dart` - ✅ 100.0% (12/12 lines)
  - `flush_bar_message_service.dart` - ❌ 0.0% (0/5 lines) - **Needs tests**
  - `snack_bar_message_service.dart` - ❌ 0.0% (0/3 lines) - **Needs tests**
  - `toast_service.dart` - ❌ 0.0% (0/2 lines) - **Needs tests**

## 🎯 Coverage Goals

### Current Status: 90.5%
- **Target:** 95%+ coverage
- **Gap:** 4.5% (10 uncovered lines)

### Priority Areas for Improvement

1. **High Priority:**
   - `utils/flush_bar_message_service.dart` - 0% coverage
   - `utils/snack_bar_message_service.dart` - 0% coverage
   - `utils/toast_service.dart` - 0% coverage

2. **Medium Priority:**
   - Review uncovered lines in `utils/` directory

## 📍 How to View the Full Report

### Option 1: Open HTML File Directly
```bash
# Navigate to the coverage directory
cd coverage/html

# Open index.html in your default browser
# On macOS:
open index.html

# On Linux:
xdg-open index.html

# On Windows:
start index.html
```

### Option 2: Use Local HTTP Server
```bash
# From project root
cd coverage/html
python3 -m http.server 8000

# Then open in browser:
# http://localhost:8000/index.html
```

### Option 3: Full Path
The coverage report is located at:
```
/Users/marwadtech/Documents/Kotlin/Learning/learning/coverage/html/index.html
```

## 📋 Report Features

The HTML coverage report includes:

1. **Summary Page** (`index.html`)
   - Overall coverage statistics
   - Directory-level breakdown
   - Visual coverage bars

2. **Directory Pages**
   - File-level coverage within each directory
   - Clickable links to detailed file views

3. **File Detail Pages** (`.gcov.html` files)
   - Line-by-line coverage visualization
   - Green = Covered lines
   - Red = Uncovered lines
   - Yellow = Partially covered lines

## 🔄 Regenerating the Report

To regenerate the coverage report:

```bash
# Method 1: Using the helper script
./coverage_helper.sh

# Method 2: Using npm
npm run test:cov

# Method 3: Manual commands
flutter test --coverage
lcov --remove coverage/lcov.info \
  '**/*.g.dart' \
  '**/*.freezed.dart' \
  '**/generated/**' \
  '**/l10n/**' \
  '**/firebase_options.dart' \
  -o coverage/lcov_cleaned.info
genhtml coverage/lcov_cleaned.info -o coverage/html
```

## 📝 Notes

- The coverage report is generated using LCOV version 2.4-0
- Function coverage is not available (function owner not identified)
- Generated files are excluded from coverage calculations
- The `coverage/` directory is in `.gitignore` and should not be committed

---

**Last Updated:** January 24, 2026
