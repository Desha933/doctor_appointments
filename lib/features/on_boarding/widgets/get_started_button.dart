import 'package:doctor_appointments/core/helper/extension.dart';
import 'package:doctor_appointments/core/routing/routes.dart';
import 'package:doctor_appointments/core/theming/app_colors.dart';
import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.pushNamed(Routes.loginScreen),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainBlue,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text('Get Started', style: Styles.font16WhiteSemiBold),
    );
  }
}
