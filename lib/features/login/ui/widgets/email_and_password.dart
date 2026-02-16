import 'package:doctor_appointments/core/helper/app_regex.dart';
import 'package:doctor_appointments/core/helper/spacing.dart';
import 'package:doctor_appointments/core/theming/app_colors.dart';
import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:doctor_appointments/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointments/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointments/features/login/ui/widgets/App_text_form_field.dart';
import 'package:doctor_appointments/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:doctor_appointments/features/login/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  TextEditingController passwordController = TextEditingController();
  bool isObscured = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasMinLength = false;

  setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text.trim());
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text.trim());
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text.trim());
        hasMinLength = AppRegex.hasMinLength(passwordController.text.trim());
      });
    });
  }

  @override
  void initState() {
    setupPasswordControllerListener();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            label: "Email",
            isShowIcon: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required';
              } else if (!AppRegex.isEmailValid(value)) {
                return 'Email is invalid Please enter a valid email address';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: passwordController,
            label: "Password",
            isShowIcon: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          verticalSpace(16),
          PasswordValidation(
            hasSpecialCharacter: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasUpperCase: hasUpperCase,
            hasLowerCase: hasLowerCase,
            hasMinLength: hasMinLength,
          ),
          verticalSpace(16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text('Forgot Password?', style: Styles.font12Blueregular),
            ),
          ),
          verticalSpace(24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: AppColors.mainBlue,
              foregroundColor: AppColors.lighterGray,
            ),

            onPressed: () => validateThenDoLogin(context),
            child: Text("Login"),
          ),
          verticalSpace(16),
          const LoginBlocListener(),
        ],
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
    }
  }
}
