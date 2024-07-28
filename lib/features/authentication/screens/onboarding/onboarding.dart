import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = OnboardingController.instance.pageController;
  bool _showSkipButton = true;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _showSkipButton = _pageController.page?.round() == 0 || _pageController.page?.round() == 1;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Page
          PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
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
          // Skip button
          Positioned(
            top: 40.0,
            right: 20.0,
            child: _showSkipButton
                ? TextButton(
              onPressed: OnboardingController.instance.skipToLoginPage,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
            )
                : Container(),
          ),
          // Smooth page indicator
          Positioned(
            bottom: 50.0,
            left: 20.0,
            child: SmoothPageIndicator(
              controller: _pageController,  // PageController
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotHeight: 8.0,
                dotWidth: 8.0,
                expansionFactor: 4.0,
                spacing: 4.0,
                dotColor: Colors.grey,
              ),
            ),
          ),
          // Next button
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: OnboardingController.instance.nextPage,
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        // Title and Subtitle
        Positioned(
          bottom: 100.0,
          left: 0.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
