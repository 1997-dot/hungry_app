import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/configs/app_theme.dart';
import 'core/configs/app_routes.dart';
import 'core/di/injector.dart';
import 'core/services/navigation_service.dart';

/// Main app widget with theme, routes, and BlocProviders
class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // TODO: Add BlocProviders here as features are implemented
        // Example:
        // BlocProvider(create: (_) => getIt<AuthBloc>()),
        // BlocProvider(create: (_) => getIt<CartBloc>()),
        // BlocProvider(create: (_) => getIt<HomeBloc>()),
        // BlocProvider(create: (_) => getIt<ProductDetailsBloc>()),
        // BlocProvider(create: (_) => getIt<CheckoutBloc>()),
        // BlocProvider(create: (_) => getIt<PaymentBloc>()),
        // BlocProvider(create: (_) => getIt<ProfileBloc>()),
        // BlocProvider(create: (_) => getIt<FavoritesBloc>()),
        // BlocProvider(create: (_) => getIt<SearchBloc>()),
        // BlocProvider(create: (_) => getIt<SplashBloc>()),
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

        // TODO: Uncomment when SplashPage is implemented
        // initialRoute: AppRoutes.splash,

        // Temporary home page - will be replaced with SplashPage
        home: const _TempHomePage(),
      ),
    );
  }
}

/// Temporary home page to test theme - will be removed when SplashPage is ready
class _TempHomePage extends StatelessWidget {
  const _TempHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text(
          'HUNGRY?',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
        ),
      ),
    );
  }
}
