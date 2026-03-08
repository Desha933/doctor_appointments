import 'package:doctor_appointments/core/networking/api_error_handler.dart';
import 'package:doctor_appointments/core/networking/api_result.dart';
import 'package:doctor_appointments/core/networking/api_service.dart';
import 'package:doctor_appointments/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointments/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody request) async {
    try {
      final response = await _apiService.login(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
