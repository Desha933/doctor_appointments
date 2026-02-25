import 'package:doctor_appointments/core/di/dependency_injection.dart';
import 'package:doctor_appointments/core/routing/app_router.dart';
import 'package:doctor_appointments/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();
  // To fix texts being hidden font bug in screenutil in release mode

  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
