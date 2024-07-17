import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:trailbuddy/common/styles/spacing_styles.dart';
import 'package:trailbuddy/utils/constants/colors.dart';
import 'package:trailbuddy/utils/constants/image_strings.dart';
import 'package:trailbuddy/utils/constants/text_strings.dart';
import 'package:trailbuddy/utils/helpers/helper_functions.dart';
import 'package:trailbuddy/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = TrailHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TrailSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo, Title & Subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(dark ? TrailImages.lightAppLogo : TrailImages.darkAppLogo),
                  ),
                  Text(TrailTexts.logInTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TrailSizes.sm),
                  Text(TrailTexts.logInSubTitle, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: TrailSizes.spaceBtwSections),

              /// Form
              Form(
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
                          onPressed: () {},
                          child: const Text(TrailTexts.forgotPassword),
                        ),
                      ],
                    ),
                    const SizedBox(height: TrailSizes.spaceBtwSections),

                    /// Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(TrailTexts.signIn),
                      ),
                    ),
                    const SizedBox(height: TrailSizes.spaceBtwItems),

                    /// Create Account Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(TrailTexts.createAccount),
                      ),
                    ),
                    const SizedBox(height: TrailSizes.spaceBtwSections),
                  ],
                ),
              ),

              /// Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Divider(color: dark ? TrailColors.darkerGrey: TrailColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
                  Text(TrailTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
                  Flexible(
                      child: Divider(color: dark ? TrailColors.darkGrey: TrailColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
                ],
              ),
              const SizedBox(height: TrailSizes.spaceBtwSections),

              /// Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: TrailColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: TrailSizes.iconMd,
                          height: TrailSizes.iconMd,
                          image: AssetImage(TrailImages.google),
                      ),
                    ),
                  ),
                  const SizedBox(width: TrailSizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: TrailColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: TrailSizes.iconMd,
                        height: TrailSizes.iconMd,
                        image: AssetImage(TrailImages.facebook),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
