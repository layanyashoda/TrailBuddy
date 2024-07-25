import 'package:flutter/material.dart';
import 'package:trailbuddy/utils/constants/colors.dart';
import 'package:trailbuddy/utils/constants/image_strings.dart';
import 'package:trailbuddy/utils/constants/sizes.dart';

class TrailSocialButtons extends StatelessWidget {
  const TrailSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TrailColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
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
          decoration: BoxDecoration(
            border: Border.all(color: TrailColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
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
    );
  }
}
