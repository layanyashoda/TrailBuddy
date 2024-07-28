import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text('Username: ${controller.username.value}', style: Theme.of(context).textTheme.headlineMedium)),
            Obx(() => Text('Email: ${controller.email.value}', style: Theme.of(context).textTheme.bodyMedium)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.updateProfile('NewUser', 'newuser@example.com');
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
