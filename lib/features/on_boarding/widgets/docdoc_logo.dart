import 'package:doctor_appointments/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocdocLogo extends StatelessWidget {
  const DocdocLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo.svg', height: 40),
        SizedBox(width: 10.w),
        Text('DocDoc', style: Styles.font24Black700Weight),
      ],
    );
  }
}
