import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trailbuddy/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:trailbuddy/utils/constants/sizes.dart';
import 'package:trailbuddy/utils/constants/text_strings.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TrailSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            Image(image: const AssetImage(TrailImages.forgotPassword), width: TrailHelperFunctions.screenWidth() * 0.6),
            const SizedBox(height: TrailSizes.spaceBtwSections),

            /// Headings
            Text(TrailTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TrailSizes.spaceBtwItems),
            Text(TrailTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TrailSizes.spaceBtwSections * 2),

            /// Text Field
            TextFormField(
              decoration: const InputDecoration(labelText: TrailTexts.email, prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: TrailSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(TrailTexts.submit)))
          ],
        ),
      ),
    );
  }
}
