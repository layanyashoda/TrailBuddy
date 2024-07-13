import 'package:flutter/material.dart';
import 'package:trailbuddy/utils/constants/image_strings.dart';
import 'package:trailbuddy/utils/constants/text_strings.dart';
import 'package:trailbuddy/utils/constants/sizes.dart';
import 'package:trailbuddy/utils/helpers/helper_functions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Page
          PageView(
            children: const [
              OnBoardingPage(
                image: TrailImages.onBoardingImage1,
                title: TrailTexts.onBoardingTitle1,
                subTitle: TrailTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TrailImages.onBoardingImage2,
                title: TrailTexts.onBoardingTitle2,
                subTitle: TrailTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TrailImages.onBoardingImage3,
                title: TrailTexts.onBoardingTitle3,
                subTitle: TrailTexts.onBoardingSubTitle3,
              ),
            ],
          ),







        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TrailSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: TrailHelperFunctions.screenWidth() * 0.8,
            height: TrailHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
          const SizedBox(height: TrailSizes.spaceBtwItems),
          Text(subTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
