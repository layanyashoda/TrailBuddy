import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trailbuddy/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:trailbuddy/features/authentication/screens/signup/widgets/signup.dart';
import 'package:trailbuddy/navigation_menu.dart';
import 'package:trailbuddy/utils/constants/text_strings.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';

class TrailLoginForm extends StatelessWidget {
  const TrailLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TrailSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TrailTexts.email,
              ),
            ),
            const SizedBox(height: TrailSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TrailTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TrailSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TrailTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TrailTexts.forgotPassword),
                ),
              ],
            ),
            const SizedBox(height: TrailSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(TrailTexts.signIn),
              ),
            ),
            const SizedBox(height: TrailSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TrailTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
