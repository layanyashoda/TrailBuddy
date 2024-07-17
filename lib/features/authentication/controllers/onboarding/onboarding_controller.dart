import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailbuddy/features/authentication/screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final PageController pageController = PageController();

  void nextPage() {
    if (pageController.page != null && pageController.page!.round() < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to the login screen after the last onboarding page
      Get.off(() => LoginScreen()); // Assuming you are using GetX for navigation
    }
  }

  void skipToLoginPage() {
    Get.off(() => LoginScreen()); // Navigate to login page
  }
}
