import 'package:dio/dio.dart';
import 'package:doctor_appointments/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to API server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with API server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: "Connection to server failed due to internet connection",
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: "Receive timeout in connection with API server",
          );
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: "Send timeout in connection with API server",
          );
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Something went wrong");
    }
  }

  static ApiErrorModel _handleError(dynamic data) {
    return ApiErrorModel(
      message: data['message'] ?? "Unknown error occurred",
      code: data['code'],
    );
  }
}
