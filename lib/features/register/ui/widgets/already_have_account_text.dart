import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  final VoidCallback onLoginTap;

  const AlreadyHaveAccountText({super.key, required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.center,
      child: RichText(
        text: TextSpan(
          text: "Already have an account yet? ",
          style: Styles.font12Blackregular,
          children: [
            TextSpan(
              text: "Login",
              style: Styles.font12Blueregular,
              recognizer: TapGestureRecognizer()..onTap = onLoginTap,
            ),
          ],
        ),
      ),
    );
  }
}
