import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Define your state and logic here
  final RxString username = 'User'.obs;
  final RxString email = 'user@example.com'.obs;

  // Example method to update profile
  void updateProfile(String newUsername, String newEmail) {
    username.value = newUsername;
    email.value = newEmail;
  }
}