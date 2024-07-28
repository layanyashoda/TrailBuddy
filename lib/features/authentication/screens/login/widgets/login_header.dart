import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TrailLoginHeader extends StatelessWidget {
  const TrailLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = TrailHelperFunctions.isDarkMode(context);
    return Column(
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
    );
  }
}