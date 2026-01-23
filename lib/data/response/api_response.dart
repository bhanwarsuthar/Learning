import 'package:learning/data/response/status.dart';

class ApiResponse<T> {
  final Status status;
  final T? data;
  final String? message;

  ApiResponse.success(this.data)
      : status = Status.success,
        message = null;

  ApiResponse.failure(this.message)
      : status = Status.failure,
        data = null;

  ApiResponse.loading()
      : status = Status.loading,
        data = null,
        message = null;

  ApiResponse.unauthorized(this.message)
      : status = Status.unauthorized,
        data = null;

  ApiResponse.notFound(this.message)
      : status = Status.notFound,
        data = null;
}