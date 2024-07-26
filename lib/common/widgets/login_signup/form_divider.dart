import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:trailbuddy/utils/constants/colors.dart';
import 'package:trailbuddy/utils/constants/text_strings.dart';
import 'package:trailbuddy/utils/helpers/helper_functions.dart';

class TrailFormDivider extends StatelessWidget {
  const TrailFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = TrailHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? TrailColors.darkerGrey : TrailColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(TrailTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? TrailColors.darkGrey : TrailColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}
