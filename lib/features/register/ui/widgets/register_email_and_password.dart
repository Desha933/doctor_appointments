import 'package:doctor_appointments/core/helper/app_regex.dart';
import 'package:doctor_appointments/core/helper/spacing.dart';
import 'package:doctor_appointments/core/theming/app_colors.dart';
import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:doctor_appointments/features/login/ui/widgets/App_text_form_field.dart';
import 'package:doctor_appointments/features/login/ui/widgets/password_validation.dart';
import 'package:doctor_appointments/features/register/logic/cubits/register_cubit.dart';
import 'package:doctor_appointments/features/register/ui/widgets/register_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterEmailAndPassword extends StatefulWidget {
  const RegisterEmailAndPassword({super.key});

  @override
  State<RegisterEmailAndPassword> createState() =>
      _RegisterEmailAndPasswordState();
}

class _RegisterEmailAndPasswordState extends State<RegisterEmailAndPassword> {
  late TextEditingController passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<RegisterCubit>().passwordController;
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<RegisterCubit>().nameController,
            label: "Name",
            isShowIcon: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),

          verticalSpace(16),
          AppTextFormField(
            controller: context.read<RegisterCubit>().phoneController,
            label: "Phone",
            isShowIcon: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Phone is required';
              } else if (!AppRegex.isPhoneValid(value)) {
                return 'Phone is invalid Please enter a valid phone number ';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<RegisterCubit>().emailController,
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
          AppTextFormField(
            controller: context.read<RegisterCubit>().confirmPasswordController,
            label: "ConfirmPassword",
            isShowIcon: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'ConfirmPassword is required';
              } else if (value != passwordController.text.trim()) {
                return 'ConfirmPassword is not match';
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

            onPressed: () => validateThenDoRegister(context),
            child: Text("Create Account"),
          ),
          verticalSpace(16),
          const RegisterBlocListener(),
        ],
      ),
    );
  }
}

void validateThenDoRegister(BuildContext context) {
  if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
    context.read<RegisterCubit>().emitregisterStates();
  }
}
