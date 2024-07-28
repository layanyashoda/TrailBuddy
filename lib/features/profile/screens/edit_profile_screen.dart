import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(text: controller.username.value),
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (value) => controller.username.value = value,
            ),
            TextField(
              controller: TextEditingController(text: controller.email.value),
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => controller.email.value = value,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the changes
                Get.back();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
