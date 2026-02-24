import 'package:doctor_appointments/core/networking/api_result.dart';
import 'package:doctor_appointments/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointments/features/login/data/repos/login_repo.dart';
import 'package:doctor_appointments/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());
  final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void emitLoginStates() async {
    emit(const LoginState.loading()); 
    LoginRequestBody request = LoginRequestBody(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    final response = await loginRepo.login(request);
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.message ?? "Something went wrong"));
      },
    );
  }
}
