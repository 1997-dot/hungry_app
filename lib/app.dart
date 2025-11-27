import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/configs/app_theme.dart';
import 'core/configs/app_routes.dart';
import 'core/services/navigation_service.dart';
import 'core/di/injector.dart';
import 'features/splash/presentation/pages/splash_page.dart';

/// Main app widget with theme, routes, and BlocProviders
class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // TODO: Add BlocProviders here as features are implemented
        // Note: SplashBloc is created directly in SplashPage, not here
        // BlocProvider(create: (_) => getIt<AuthBloc>()),
        // BlocProvider(create: (_) => getIt<CartBloc>()),
        // BlocProvider(create: (_) => getIt<HomeBloc>()),
        // BlocProvider(create: (_) => getIt<ProductDetailsBloc>()),
        // BlocProvider(create: (_) => getIt<CheckoutBloc>()),
        // BlocProvider(create: (_) => getIt<PaymentBloc>()),
        // BlocProvider(create: (_) => getIt<ProfileBloc>()),
        // BlocProvider(create: (_) => getIt<FavoritesBloc>()),
        // BlocProvider(create: (_) => getIt<SearchBloc>()),
      ],
      child: MaterialApp(
        title: 'Hungry',
        debugShowCheckedModeBanner: false,

        // Theme
        theme: AppTheme.lightTheme,

        // Navigation
        navigatorKey: getIt<NavigationService>().navigatorKey,

        // Routes
        routes: AppRoutes.getRoutes(),

        // Start with Splash screen
        home: const SplashPage(),
      ),
    );
  }
}
