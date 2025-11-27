import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/app_colors.dart';
import '../../../../core/configs/app_routes.dart';
import '../../../../core/di/injector.dart';
import '../blocs/splash_bloc.dart';
import '../widgets/animated_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashBloc>()..add(const CheckAuthStatusEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashAuthenticated) {
            // User is logged in - navigate to home
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else if (state is SplashUnauthenticated) {
            // User is not logged in - navigate to login
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        },
        child: const Scaffold(
          backgroundColor: AppColors.splashBackground,
          body: Center(
            child: AnimatedLogo(),
          ),
        ),
      ),
    );
  }
}
