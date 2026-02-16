import 'package:doctor_appointments/core/di/dependency_injection.dart';
import 'package:doctor_appointments/core/routing/routes.dart';
import 'package:doctor_appointments/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_appointments/features/login/ui/home_screen.dart';
import 'package:doctor_appointments/features/login/ui/login_screen.dart';
import 'package:doctor_appointments/features/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed to any screen
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No Route Found'))),
        );
    }
  }
}
