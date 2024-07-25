import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trailbuddy/utils/constants/colors.dart';
import 'package:trailbuddy/utils/helpers/helper_functions.dart';

import 'features/shop/screens/home/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = TrailHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TrailColors.black : Colors.white,
          indicatorColor: darkMode ? TrailColors.white.withOpacity(0.1) : TrailColors.black.withOpacity(0.1),
        
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.search_normal), label: 'Explore'),
            NavigationDestination(icon: Icon(Iconsax.money), label: 'Budget'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Favourites'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [ const HomeScreen(), Container(color: Colors.purple), Container(color: Colors.orange), Container(color: Colors.blue)];
}
