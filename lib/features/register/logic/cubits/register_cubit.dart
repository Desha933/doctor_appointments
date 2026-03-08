import 'package:doctor_appointments/core/networking/api_result.dart';
import 'package:doctor_appointments/features/register/data/models/register_request_body.dart';
import 'package:doctor_appointments/features/register/data/repos/register_repo.dart';
import 'package:doctor_appointments/features/register/logic/cubits/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit(this.registerRepo) : super(const RegisterState.initial());
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void emitregisterStates() async {
    emit(const RegisterState.loading());
    RegisterRequestBody request = RegisterRequestBody(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      gender: 1,
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      passwordConfirmation: confirmPasswordController.text.trim(),
    );
    final response = await registerRepo.register(request);
    response.when(
      success: (registerResponse) {
        emit(RegisterState.success(registerResponse));
      },
      failure: (error) {
        emit(
          RegisterState.error(error: error.message ?? "Something went wrong"),
        );
      },
    );
  }
}
