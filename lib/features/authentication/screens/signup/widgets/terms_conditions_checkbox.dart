import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TrailTermsAndConditionCheckBox extends StatelessWidget {
  const TrailTermsAndConditionCheckBox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = TrailHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value){})),
        const SizedBox(width: TrailSizes.spaceBtwItems),
        Text.rich(
            TextSpan(children: [
              TextSpan(text: '${TrailTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${TrailTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TrailColors.white : TrailColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TrailColors.white : TrailColors.primary,
              )),
              TextSpan(text: ' ${TrailTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${TrailTexts.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TrailColors.white : TrailColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TrailColors.white : TrailColors.primary,
              )),
            ])
        )
      ],
    );
  }
}