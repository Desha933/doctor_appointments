import 'package:doctor_appointments/core/theming/app_colors.dart';
import 'package:doctor_appointments/core/theming/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
  static TextStyle font12Blackregular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.black,
  );
  static TextStyle font24BlueBlod = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.mainBlue,
  );

  static TextStyle font12Blueregular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.mainBlue,
  );
  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.lightGray,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );

  static TextStyle font14WhiteMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.lightGray,
  );
  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.lightGray,
  );
  static TextStyle font14BlackBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );
}
