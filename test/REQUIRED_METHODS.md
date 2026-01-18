# Required Methods and Classes for Register User Implementation

This document lists all the methods and classes that need to be implemented based on the test cases.

## Required Classes

### 1. UserRegistrationService
**Location**: `lib/services/user_registration_service.dart` (suggested)

**Purpose**: Main service class handling user registration logic

**Required Methods**:

```dart
class UserRegistrationService {
  // Validation Methods
  ValidationResult validateName(String name);
  ValidationResult validateEmail(String email);
  ValidationResult validateMobile(String mobile);
  ValidationResult validatePassword(String password);
  ValidationResult validateGender(String gender);
  
  // Registration Methods
  Future<UserRegistrationResponse> registerUser(UserRegistrationRequest request);
  
  // Existence Check Methods
  Future<bool> checkEmailExists(String email);
  Future<bool> checkMobileExists(String mobile);
}
```

### 2. UserRegistrationRequest (Model)
**Location**: `lib/models/user_registration_request.dart` (suggested)

**Purpose**: Request model for user registration

**Required Properties**:
```dart
class UserRegistrationRequest {
  final String name;
  final String email;
  final String mobile;
  final String password;
  final String gender;
  
  UserRegistrationRequest({
    required this.name,
    required this.email,
    required this.mobile,
    required this.password,
    required this.gender,
  });
  
  // Optional: toJson method for API calls
  Map<String, dynamic> toJson();
}
```

### 3. UserRegistrationResponse (Model)
**Location**: `lib/models/user_registration_response.dart` (suggested)

**Purpose**: Response model for user registration

**Required Properties**:
```dart
class UserRegistrationResponse {
  final bool success;
  final String? userId;
  final DateTime? registrationTimestamp;
  final String? errorMessage;
  final Map<String, String>? validationErrors;
  
  UserRegistrationResponse({
    required this.success,
    this.userId,
    this.registrationTimestamp,
    this.errorMessage,
    this.validationErrors,
  });
  
  // Optional: fromJson method for API responses
  factory UserRegistrationResponse.fromJson(Map<String, dynamic> json);
  
  // Optional: toJson method
  Map<String, dynamic> toJson();
}
```

### 4. ValidationResult (Model)
**Location**: `lib/models/validation_result.dart` (suggested)

**Purpose**: Result model for field validation

**Required Properties**:
```dart
class ValidationResult {
  final bool isValid;
  final String? errorMessage;
  
  ValidationResult({
    required this.isValid,
    this.errorMessage,
  });
  
  // Factory constructors for convenience
  factory ValidationResult.valid() => ValidationResult(isValid: true);
  factory ValidationResult.invalid(String message) => 
    ValidationResult(isValid: false, errorMessage: message);
}
```

## Validation Rules to Implement

### Name Validation
- **Required**: Yes
- **Min Length**: 2 characters
- **Max Length**: 50 characters (configurable)
- **Allowed Characters**: Alphabets (a-z, A-Z) and spaces only
- **Not Allowed**: Numbers, special characters
- **Trim**: Leading and trailing whitespace should be trimmed

### Email Validation (Primary Field)
- **Required**: Yes
- **Format**: Standard email format (user@domain.tld)
- **Allowed**: 
  - Subdomains (user@mail.example.com)
  - Plus signs (user+tag@example.com)
  - Numbers (user123@example.com)
- **Not Allowed**: 
  - Spaces
  - Multiple @ symbols
  - Missing @ symbol
  - Missing domain
  - Missing TLD
- **Case**: Convert to lowercase before storage
- **Trim**: Leading and trailing whitespace should be trimmed
- **Uniqueness**: Must be unique in the system

### Mobile Validation
- **Required**: Yes
- **Format**: 
  - 10 digits (e.g., 9876543210)
  - Or with country code (e.g., +919876543210)
- **Allowed Characters**: Numeric digits only (0-9), optional + prefix
- **Not Allowed**: 
  - Letters
  - Special characters (except + at start)
  - Invalid prefixes (000, 111, etc.)
- **Length**: 
  - Minimum: 10 digits
  - Maximum: 15 digits (with country code)
- **Uniqueness**: Must be unique in the system

### Password Validation
- **Required**: Yes
- **Min Length**: 8 characters
- **Max Length**: 128 characters (configurable)
- **Required Characters**:
  - At least one uppercase letter (A-Z)
  - At least one lowercase letter (a-z)
  - At least one number (0-9)
  - At least one special character (!@#$%^&*()_+-=[]{}|;:,.<>?)
- **Storage**: Must be hashed before storing in database
- **Response**: Should not be included in API response

### Gender Validation
- **Required**: Yes
- **Allowed Values**: 
  - "Male"
  - "Female"
  - "Other"
- **Case Sensitivity**: Case-insensitive (accepts "male", "MALE", "Male", etc.)

## Additional Requirements

### Data Processing
1. **Name**: Trim whitespace before validation and storage
2. **Email**: 
   - Trim whitespace before validation
   - Convert to lowercase before storage
3. **Password**: Hash using secure hashing algorithm (e.g., bcrypt, argon2) before storage

### Database Operations
1. **Email Uniqueness Check**: Query database to check if email exists
2. **Mobile Uniqueness Check**: Query database to check if mobile exists
3. **User Creation**: Insert new user record with hashed password
4. **Transaction Handling**: Use database transactions for atomic operations

### Error Handling
1. **Validation Errors**: Return specific error messages for each invalid field
2. **Duplicate Errors**: Return clear error messages for duplicate email/mobile
3. **Database Errors**: Handle database connection failures gracefully
4. **Concurrent Requests**: Handle race conditions for duplicate email/mobile

### Security Considerations
1. **Password Hashing**: Use secure, one-way hashing algorithm
2. **Input Sanitization**: Sanitize all inputs to prevent injection attacks
3. **Rate Limiting**: Consider implementing rate limiting for registration endpoints
4. **Audit Logging**: Log registration attempts for security audit

## Suggested Implementation Order

1. Create model classes (UserRegistrationRequest, UserRegistrationResponse, ValidationResult)
2. Implement individual validation methods (validateName, validateEmail, etc.)
3. Implement existence check methods (checkEmailExists, checkMobileExists)
4. Implement main registration method (registerUser)
5. Add error handling and edge case handling
6. Add data sanitization and security features

## Testing Notes

- All test cases are currently commented out with `//` 
- Uncomment test code as you implement each method
- Use `flutter test` to run the tests
- Tests use `expect()` assertions from `flutter_test` package
