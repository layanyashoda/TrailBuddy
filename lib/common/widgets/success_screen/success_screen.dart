import 'package:flutter/material.dart';
import 'package:trailbuddy/common/styles/spacing_styles.dart';

import 'package:trailbuddy/utils/constants/sizes.dart';
import 'package:trailbuddy/utils/constants/text_strings.dart';
import 'package:trailbuddy/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TrailSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(image), width: TrailHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: TrailSizes.spaceBtwSections),
              
              /// Title & Subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TrailSizes.spaceBtwItems),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TrailSizes.spaceBtwSections),
              
              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: onPressed, child: const Text(TrailTexts.tContinue))),
            ],
          ),
        ),
      ),
    );
  }
}