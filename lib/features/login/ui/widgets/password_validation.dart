import 'package:doctor_appointments/core/helper/spacing.dart';
import 'package:doctor_appointments/core/theming/app_colors.dart';
import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasMinLength;
  const PasswordValidation({
    super.key,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At Least 1 lower Case Letter ", hasLowerCase),
        buildValidationRow("At Least 1 upper Case Letter ", hasUpperCase),
        buildValidationRow("At Least 1 number ", hasNumber),
        buildValidationRow(
          "At Least 1 special character ",
          hasSpecialCharacter,
        ),
        buildValidationRow("At Least 8 characters ", hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(radius: 2.5, backgroundColor: AppColors.gray),
        horizonalSpace(6),
        Text(
          text,
          style: Styles.font13GrayRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            color: hasValidated ? AppColors.gray : AppColors.darkBlue,
            decorationColor: AppColors.green,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
