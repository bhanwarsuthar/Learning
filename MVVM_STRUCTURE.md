# MVVM Architecture Structure

This project follows the MVVM (Model-View-ViewModel) architecture pattern using Provider for state management.

## Folder Structure

```
lib/
├── models/                          # Data Models
│   └── user_registration_model.dart
│
├── view_models/                    # Business Logic (ViewModel)
│   └── register_view_model.dart
│
├── services/                       # API Services
│   └── api_service.dart
│
├── repositories/                  # Data Layer (Repository Pattern)
│   └── auth_repository.dart
│
├── presentation/                   # UI Screens (Views)
│   └── auth/
│       └── register_screen.dart
│
├── common/                         # Shared Utilities
│   └── utils/
│       └── validations/
│           └── edit_text_validation.dart
│
└── main.dart                       # App Entry Point with Provider Setup
```

## Architecture Layers

### 1. **Models** (`lib/models/`)
- **Purpose**: Data structures and DTOs (Data Transfer Objects)
- **Files**:
  - `user_registration_model.dart`: Contains `UserRegistrationModel` and `UserRegistrationResponse`
- **Responsibilities**:
  - Define data structures
  - Handle JSON serialization/deserialization
  - No business logic

### 2. **ViewModels** (`lib/view_models/`)
- **Purpose**: Business logic and state management
- **Files**:
  - `register_view_model.dart`: Handles registration logic, validation, and state
- **Responsibilities**:
  - Form validation
  - State management (loading, success, error)
  - Communication with repositories
  - Uses `ChangeNotifier` for Provider integration

### 3. **Services** (`lib/services/`)
- **Purpose**: API communication layer
- **Files**:
  - `api_service.dart`: HTTP client wrapper
- **Responsibilities**:
  - HTTP GET/POST requests
  - API endpoint management
  - Error handling at network level

### 4. **Repositories** (`lib/repositories/`)
- **Purpose**: Data access abstraction layer
- **Files**:
  - `auth_repository.dart`: Authentication-related data operations
- **Responsibilities**:
  - Abstract data sources (API, local database, etc.)
  - Transform API responses to models
  - Handle data layer errors

### 5. **Views** (`lib/presentation/`)
- **Purpose**: UI components and screens
- **Files**:
  - `register_screen.dart`: Registration form UI
- **Responsibilities**:
  - Display UI
  - User interactions
  - Consume ViewModel via Provider
  - No business logic

## Data Flow

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

## Key Components

### RegisterViewModel
- **State Management**: Uses `ChangeNotifier` for Provider
- **States**: `idle`, `loading`, `success`, `error`
- **Validation**: Field-level validation methods
- **Error Handling**: Validation errors and API errors

### Provider Setup
- Configured in `main.dart` using `MultiProvider`
- ViewModel is provided at app level
- Views consume ViewModel using `Consumer` or `context.read()`

## Benefits of This Architecture

1. **Separation of Concerns**: Each layer has a single responsibility
2. **Testability**: Easy to unit test ViewModels and Repositories
3. **Maintainability**: Clear structure makes code easy to navigate
4. **Scalability**: Easy to add new features following the same pattern
5. **Reusability**: Services and repositories can be reused across features

## Adding New Features

To add a new feature (e.g., Login):

1. **Model**: Create `lib/models/login_model.dart`
2. **ViewModel**: Create `lib/view_models/login_view_model.dart`
3. **Repository**: Add methods to `auth_repository.dart` or create new repository
4. **View**: Create `lib/presentation/auth/login_screen.dart`
5. **Provider**: Add ViewModel to `MultiProvider` in `main.dart`

## Dependencies

- `provider: ^6.1.1` - State management
- `http: ^1.2.0` - HTTP client for API calls
- `url_launcher: ^6.2.5` - Opening external URLs

## Testing Strategy

- **Unit Tests**: Test ViewModels and Repositories
- **Widget Tests**: Test UI components
- **Integration Tests**: Test complete user flows

Test files are located in the `test/` directory following the same structure.
