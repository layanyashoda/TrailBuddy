import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trailbuddy/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:trailbuddy/features/authentication/screens/signup/widgets/verify_email.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class TrailSignupForm extends StatelessWidget {
  const TrailSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// First Name & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(labelText: TrailTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TrailSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(labelText: TrailTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TrailSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(labelText: TrailTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TrailSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            decoration: const InputDecoration(labelText: TrailTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TrailSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            decoration: const InputDecoration(labelText: TrailTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: TrailSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TrailTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TrailSizes.spaceBtwSections),

          /// Terms & Conditions Checkbox
          const TrailTermsAndConditionCheckBox(),
          const SizedBox(height: TrailSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const VerifyEmailScreen() ), child: const Text(TrailTexts.createAccount))),
        ],
      ),
    );
  }
}
