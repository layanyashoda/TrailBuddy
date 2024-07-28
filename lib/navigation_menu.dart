import 'package:TrailBuddy/utils/constants/colors.dart';
import 'package:TrailBuddy/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/budget/budget_screen.dart';
import 'features/favorites/screens/favorites_screen.dart';
import 'features/profile/screens/profile_screen.dart';
import 'features/shop/screens/home/home_screen.dart';

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

  final screens = [ const HomeScreen(), BudgetScreen(), const FavoritesScreen(), ProfileScreen(),];
}
