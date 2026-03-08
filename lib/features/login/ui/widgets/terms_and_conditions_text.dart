import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: Styles.font14GrayRegular,
          ),
          TextSpan(text: 'Terms & Conditions', style: Styles.font14BlackBold),
          TextSpan(text: ' and ', style: Styles.font14GrayRegular),
          TextSpan(text: 'Privacy Policy', style: Styles.font14BlackBold),
        ],
      ),
    );
  }
}
