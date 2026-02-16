import 'package:doctor_appointments/core/helper/spacing.dart';
import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:doctor_appointments/features/login/ui/widgets/already_have_account_text.dart';
import 'package:doctor_appointments/features/login/ui/widgets/email_and_password.dart';
import 'package:doctor_appointments/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Wellcome Back', style: Styles.font24BlueBlod),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: Styles.font13GrayRegular,
                ),
                verticalSpace(36),
                EmailAndPassword(),
                verticalSpace(16),
                TermsAndConditionsText(),
                verticalSpace(24),
                AlreadyHaveAccountText(onSignUpTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
