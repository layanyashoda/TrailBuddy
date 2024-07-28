// File: features/profile/widgets/profile_header.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Text(
            controller.username.value,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
          )),
          Obx(() => Text(
            controller.email.value,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
          )),
        ],
      ),
    );
  }
}
