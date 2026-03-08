import 'package:doctor_appointments/core/routing/routes.dart';
import 'package:doctor_appointments/core/theming/app_colors.dart';
import 'package:doctor_appointments/features/register/logic/cubits/register_cubit.dart';
import 'package:doctor_appointments/features/register/logic/cubits/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showLoadingDialog(context),
          success: (data) {
            Navigator.pop(context);
            Navigator.pushNamed(context, Routes.loginScreen);
          },
          error: (error) {
            Navigator.pop(context);
            showErrorDialog(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          Center(child: CircularProgressIndicator(color: AppColors.mainBlue)),
    );
  }

  void showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
