import 'package:doctor_appointments/core/di/dependency_injection.dart';
import 'package:doctor_appointments/core/routing/app_router.dart';
import 'package:doctor_appointments/doc_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
