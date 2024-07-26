import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trailbuddy/common/widgets/success_screen/success_screen.dart';
import 'package:trailbuddy/features/authentication/screens/login/login.dart';
import 'package:trailbuddy/utils/constants/sizes.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TrailSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(TrailImages.deliveredEmailPic),width: TrailHelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TrailSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(TrailTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TrailSizes.spaceBtwItems),
              Text('layanyashoda@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: TrailSizes.spaceBtwItems),
              Text(TrailTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TrailSizes.spaceBtwItems),


              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => SuccessScreen(
                          image: TrailImages.staticSuccessPic,
                          title: TrailTexts.yourAccountCreatedTitle,
                          subTitle: TrailTexts.yourAccountCreatedSubTitle,
                          onPressed: () => Get.to(() => const LoginScreen()),
                        ),),
                    child: const Text(TrailTexts.tContinue)),
              ),
              const SizedBox(height: TrailSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(TrailTexts.resendEmail))),
            ],
          ),
        ),
      )
    );
  }
}
