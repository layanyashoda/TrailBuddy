import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailbuddy/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trailbuddy/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:trailbuddy/utils/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());

    return GetMaterialApp(
      title: 'TrailBuddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
    );
  }
}
