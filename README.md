# Learning Flutter App

A Flutter project implementing MVVM (Model-View-ViewModel) architecture using Provider for state management and HTTP for API communication.

## 📋 Table of Contents

- [Project Statistics](#-project-statistics)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
- [Code Coverage](#code-coverage)
- [Testing](#testing)
- [Dependencies](#dependencies)

## 📊 Project Statistics

| Metric | Value | Status |
|--------|-------|--------|
| **Total Commits** | 16 | ✅ Active |
| **Code Coverage** | 93.7% | ✅ Excellent |
| **Last Updated** | 2026-01-25 15:36:54 UTC | 🔄 Auto-updated |
| **Latest Commit** | `247c916` | 📝 |

> **Note:** These statistics are automatically updated on every commit via GitHub Actions. View live dashboard at: [GitHub Pages](https://bhanwarsuthar.github.io/Learning/)

---
## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository
```bash
git clone <repositories-url>
cd learning
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## 📁 Project Structure

```
learning/
├── android/                          # Android platform-specific code
├── ios/                              # iOS platform-specific code
├── lib/                              # Main application code
│   ├── common/                       # Shared utilities and common code
│   │   └── utils/
│   │       └── validations/
│   │           └── edit_text_validation.dart
│   │
│   ├── data/                         # Data layer
│   │   ├── app_exceptions.dart       # Custom exception classes
│   │   ├── network/                  # Network layer
│   │   │   ├── base_api_service.dart
│   │   │   └── network_api_service.dart
│   │   └── response/                 # API response models
│   │       ├── api_response.dart
│   │       └── status.dart
│   │
│   ├── models/                       # Data models (MVVM)
│   │   └── user_registration_model.dart
│   │
│   ├── presentation/                # UI layer (Views)
│   │   └── auth/
│   │       └── register_screen.dart
│   │
│   ├── repositories/                 # Data access layer (Repository pattern)
│   │   └── auth_repository.dart
│   │
│   ├── services/                     # API services
│   │   └── api_service.dart
│   │
│   ├── res/                          # Resources
│   │   ├── app_colors.dart           # Color constants
│   │   ├── app_urls.dart             # API URLs
│   │   └── components/               # Reusable UI components
│   │       └── custom_button.dart
│   │
│   ├── utils/                        # Utility functions
│   │   ├── filed_focus_change_service.dart
│   │   ├── flush_bar_message_service.dart
│   │   ├── routes/                   # Navigation routes
│   │   │   ├── routes_name.dart
│   │   │   └── routes.dart
│   │   ├── snack_bar_message_service.dart
│   │   ├── toast_service.dart
│   │   └── utils.dart
│   │
│   ├── view/                         # Alternative view folder (legacy)
│   │   ├── home_view.dart
│   │   └── register_view.dart
│   │
│   ├── view_model/                   # Alternative view model folder (legacy)
│   │   └── auth_view_model.dart
│   │
│   ├── view_models/                  # Business logic layer (MVVM)
│   │   └── register_view_model.dart
│   │
│   └── main.dart                     # App entry point
│
├── test/                             # Test files
│   ├── data/
│   │   └── network/
│   │       └── network_api_service_test.dart
│   ├── utils/
│   │   ├── field_focus_change_service_test.dart
│   │   ├── flush_bar_message_service_test.dart
│   │   ├── snack_bar_message_service_test.dart
│   │   ├── toast_service_test.dart
│   │   └── utils_test.dart
│   ├── view/
│   │   └── register_screen_test.dart
│   ├── register_user_test.dart       # User registration test cases
│   ├── login_test.dart               # Login test cases
│   └── verification_test.dart        # Verification test cases
│
├── coverage/                         # Code coverage reports (generated)
│   ├── lcov.info                     # LCOV coverage data
│   ├── lcov_cleaned.info             # Cleaned coverage data
│   └── html/                         # HTML coverage report
│       └── index.html                # Coverage report homepage
│
├── coverage_helper.sh                # Script to generate coverage reports
├── package.json                       # NPM scripts for coverage
├── pubspec.yaml                       # Flutter dependencies
└── README.md                          # This file
```

## 🏗️ Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture pattern:

### Architecture Layers

1. **Models** (`lib/models/`)
   - Data structures and DTOs
   - JSON serialization/deserialization
   - Example: `UserRegistrationModel`, `UserRegistrationResponse`

2. **Views** (`lib/presentation/`)
   - UI components and screens
   - User interactions
   - Consumes ViewModel via Provider
   - Example: `RegisterScreen`

3. **ViewModels** (`lib/view_models/`)
   - Business logic and state management
   - Form validation
   - Uses `ChangeNotifier` for Provider integration
   - Example: `RegisterViewModel`

4. **Repositories** (`lib/repositories/`)
   - Data access abstraction layer
   - Transforms API responses to models
   - Example: `AuthRepository`

5. **Services** (`lib/services/`)
   - API communication layer
   - HTTP client wrapper
   - Example: `ApiService`

6. **Data Layer** (`lib/data/`)
   - Network services
   - Response models
   - Exception handling

### Data Flow

```
User Action (View)
    ↓
ViewModel (Business Logic)
    ↓
Repository (Data Access)
    ↓
Service (API Calls)
    ↓
Backend API
```

## 📊 Code Coverage

### 🚀 Quick Start - View Coverage Report

**👉 [View Live Coverage Report on GitHub Pages](https://bhanwarsuthar.github.io/Learning/coverage_viewer.html)** - Interactive HTML viewer

**Local Development:** [Open coverage_viewer.html](coverage_viewer.html) in your browser

Or use the automated script:
```bash
./view_coverage.sh
```

This script will:
1. ✅ Run all tests with coverage
2. 🧹 Clean coverage data
3. 📊 Generate HTML report
4. 🌐 Automatically open in your browser

### Generating Coverage Reports

The project includes multiple ways to generate code coverage reports:

#### Method 1: Quick View Script (Recommended) ⭐

```bash
# Make executable (first time only)
chmod +x view_coverage.sh

# Generate and view report
./view_coverage.sh
```

This script automatically:
- Runs Flutter tests with coverage
- Cleans coverage data
- Generates HTML report
- Opens in your default browser

#### Method 2: Using the coverage helper script

```bash
# Make the script executable (first time only)
chmod +x coverage_helper.sh

# Run the script
./coverage_helper.sh
```

This script:
1. Runs Flutter tests with coverage: `flutter test --coverage`
2. Cleans the coverage data by removing generated files
3. Generates HTML report: `genhtml coverage/lcov_cleaned.info -o coverage/html`

#### Method 3: Using npm script

```bash
npm run test:cov
```

#### Method 4: Manual commands

```bash
# Run tests with coverage
flutter test --coverage

# Clean coverage data (optional)
lcov --remove coverage/lcov.info \
  '**/*.g.dart' \
  '**/*.freezed.dart' \
  '**/generated/**' \
  '**/l10n/**' \
  '**/firebase_options.dart' \
  -o coverage/lcov_cleaned.info

# Generate HTML report
genhtml coverage/lcov_cleaned.info -o coverage/html
```

### Viewing Coverage Report

#### Option 1: Interactive Viewer (Recommended) 🌐

Open `coverage_viewer.html` in your browser - it will automatically load the latest coverage report:

```bash
# On macOS
open coverage_viewer.html

# On Linux
xdg-open coverage_viewer.html

# On Windows
start coverage_viewer.html
```

Or simply double-click `coverage_viewer.html` in your file explorer.

#### Option 2: Direct HTML File

After generating the coverage report, open the HTML file directly:

```bash
# On macOS
open coverage/html/index.html

# On Linux
xdg-open coverage/html/index.html

# On Windows
start coverage/html/index.html
```

Or manually navigate to: `coverage/html/index.html`

### 📈 Current Coverage Status

**Last Generated:** Check `coverage/html/index.html` or use the [Interactive Viewer](coverage_viewer.html)

**Typical Coverage:**
- Overall: ~90%+ line coverage
- `common/utils/validations/`: 100% ✅
- `data/`: 100% ✅
- `data/network/`: 100% ✅
- `utils/`: ~60% ⚠️ (needs improvement)

### Coverage Report Structure

The HTML coverage report includes:

- **Summary Page**: Overall coverage statistics
  - Line coverage percentage
  - Function coverage percentage
  - Branch coverage percentage
  
- **File-by-File Breakdown**: Detailed coverage for each file
  - Covered lines (highlighted in green)
  - Uncovered lines (highlighted in red)
  - Partially covered lines (highlighted in yellow)
  
- **Source Code View**: Line-by-line coverage visualization

### 📱 Interactive Coverage Viewer

The project includes an interactive HTML viewer (`coverage_viewer.html`) that:
- ✅ Automatically loads the latest coverage report
- ✅ Provides refresh and generation buttons
- ✅ Shows real-time status updates
- ✅ Works offline once the report is generated
- ✅ Responsive design for all devices

### Coverage Files

- `coverage/lcov.info` - Raw LCOV coverage data
- `coverage/lcov_cleaned.info` - Cleaned coverage data (excludes generated files)
- `coverage/html/` - HTML coverage report directory
  - `index.html` - Main coverage report page
  - Individual file coverage pages

### Excluded from Coverage

The following files are excluded from coverage reports:
- Generated files (`*.g.dart`, `*.freezed.dart`)
- Generated directories (`**/generated/**`)
- Localization files (`**/l10n/**`)
- Firebase configuration (`**/firebase_options.dart`)

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/register_user_test.dart
```

### Test Structure

Tests are organized to match the project structure:

- **Unit Tests**: Test individual functions and classes
- **Widget Tests**: Test UI components
- **Integration Tests**: Test complete user flows

### Test Files

- `test/register_user_test.dart` - User registration test cases
- `test/login_test.dart` - Login functionality test cases
- `test/verification_test.dart` - Verification test cases
- `test/data/` - Data layer tests
- `test/utils/` - Utility function tests
- `test/view/` - View/UI tests

## 📦 Dependencies

### Main Dependencies

- `flutter` - Flutter SDK
- `provider: ^6.1.1` - State management
- `http: ^1.2.0` - HTTP client for API calls
- `url_launcher: ^6.2.5` - Opening external URLs

### Dev Dependencies

- `flutter_test` - Flutter testing framework
- `flutter_lints: ^5.0.0` - Linting rules
- `test: ^1.24.0` - Unit testing framework
- `mockito: ^5.4.4` - Mocking library
- `build_runner: ^2.4.7` - Code generation

See `pubspec.yaml` for the complete list of dependencies.

## 🔧 Development

### Adding New Features

To add a new feature following MVVM pattern:

1. **Model**: Create model in `lib/models/`
2. **ViewModel**: Create ViewModel in `lib/view_models/`
3. **Repository**: Add methods to repository in `lib/repositories/`
4. **View**: Create UI screen in `lib/presentation/`
5. **Provider**: Add ViewModel to `MultiProvider` in `main.dart`
6. **Tests**: Add test cases in `test/`

### Code Style

The project follows Flutter's recommended linting rules. Run:

```bash
flutter analyze
```

## 📝 License

This project is for learning purposes.

## 👥 Contributors

- Bhanwar Suthar

---

**Note**: The `coverage/` directory is generated and should not be committed to version control (already in `.gitignore`).
