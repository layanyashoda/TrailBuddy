import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailbuddy/common/widgets/login_signup/form_divider.dart';
import 'package:trailbuddy/common/widgets/login_signup/social_buttons.dart';
import 'package:trailbuddy/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:trailbuddy/utils/constants/sizes.dart';
import 'package:trailbuddy/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TrailSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TrailTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TrailSizes.spaceBtwSections),

              /// Form
              const TrailSignupForm(),
              const SizedBox(height: TrailSizes.spaceBtwSections),

              /// Divider
              TrailFormDivider(dividerText: TrailTexts.orSignInWith.capitalize!),
              const SizedBox(height: TrailSizes.spaceBtwSections),

              /// Social Buttons
              const TrailSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

