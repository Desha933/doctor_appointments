import 'package:doctor_appointments/core/helper/spacing.dart';
import 'package:doctor_appointments/core/routing/routes.dart';
import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:doctor_appointments/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:doctor_appointments/features/register/ui/widgets/already_have_account_text.dart';
import 'package:doctor_appointments/features/register/ui/widgets/register_email_and_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Create Account', style: Styles.font24BlueBlod),
                verticalSpace(8),
                Text(
                  'Create an account to get started',
                  style: Styles.font13GrayRegular,
                ),
                verticalSpace(36),
                RegisterEmailAndPassword(),
                verticalSpace(16),
                TermsAndConditionsText(),
                verticalSpace(24),
                AlreadyHaveAccountText(
                  onLoginTap: () =>
                      Navigator.pushNamed(context, Routes.loginScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
