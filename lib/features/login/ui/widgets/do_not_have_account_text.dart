import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccountText extends StatelessWidget {
  final VoidCallback onSignUpTap;

  const DoNotHaveAccountText({super.key, required this.onSignUpTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,
      child: RichText(
        text: TextSpan(
          text: "Don't have an account yet? ",
          style: Styles.font12Blackregular,
          children: [
            TextSpan(
              text: "Sign Up",
              style: Styles.font12Blueregular,
              recognizer: TapGestureRecognizer()..onTap = onSignUpTap,
            ),
          ],
        ),
      ),
    );
  }
}
