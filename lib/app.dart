import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailbuddy/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trailbuddy/utils/theme/theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TrailAppTheme.lightTheme,
      darkTheme: TrailAppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}

