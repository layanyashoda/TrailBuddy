import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'features/authentication/screens/onboarding/onboarding.dart';
import 'features/profile/controllers/profile_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    Get.put(ProfileController());

    return GetMaterialApp(
      title: 'TrailBuddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(),
    );
  }
}
