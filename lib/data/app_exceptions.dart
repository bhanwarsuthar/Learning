class AppException implements Exception {
  final String message;
  final String? prefix;

  AppException([this.message = 'An error occurred', this.prefix]);

  @override
  String toString() {
    return prefix != null ? '$prefix: $message' : message;
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message = 'Error During Communication'])
      : super(message, 'FetchDataException');
}

class BadRequestException extends AppException {
  BadRequestException([String message = 'Invalid Request'])
      : super(message, 'BadRequestException');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String message = 'Unauthorized'])
      : super(message, 'UnauthorizedException');
}

class InvalidInputException extends AppException {
  InvalidInputException([String message = 'Invalid Input'])
      : super(message, 'InvalidInputException');
}
