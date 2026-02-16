import 'package:dio/dio.dart';
import 'package:doctor_appointments/core/networking/api_constant.dart';
import 'package:doctor_appointments/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointments/features/login/data/models/login_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody request);
}
