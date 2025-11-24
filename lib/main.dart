import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/configs/app_theme.dart';
import 'core/configs/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const HungryApp());
  });
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungry',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // TODO: Add routes configuration
      // routes: AppRoutes.routes,
      // initialRoute: AppRoutes.splash,
      home: const _TempHomePage(), // Temporary - will be replaced with Splash
    );
  }
}

// Temporary home page to test theme - will be removed later
class _TempHomePage extends StatelessWidget {
  const _TempHomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HUNGRY?',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: AppColors.textLight,
                letterSpacing: 2,
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
