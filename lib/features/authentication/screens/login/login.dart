import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailbuddy/common/styles/spacing_styles.dart';
import 'package:trailbuddy/utils/constants/sizes.dart';
import 'package:trailbuddy/common/widgets/login_signup/form_divider.dart';
import 'package:trailbuddy/common/widgets/login_signup/social_buttons.dart';
import 'package:trailbuddy/features/authentication/screens/login/widgets/login_form.dart';
import 'package:trailbuddy/features/authentication/screens/login/widgets/login_header.dart';
import 'package:trailbuddy/utils/constants/text_strings.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TrailSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const TrailLoginHeader(),
              const SizedBox(height: TrailSizes.spaceBtwSections),

              const TrailLoginForm(),
              const SizedBox(height: TrailSizes.spaceBtwSections),

              TrailFormDivider(dividerText: TrailTexts.orSignInWith.capitalize!),
              const SizedBox(height: TrailSizes.spaceBtwSections),

              const TrailSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
