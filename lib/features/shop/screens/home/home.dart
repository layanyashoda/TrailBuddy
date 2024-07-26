import 'package:flutter/material.dart';
import 'package:trailbuddy/features/shop/screens/home/widgets/home_appbar.dart';

import '../../../../common/widgets/custom_shapes/containers/Primary_Header_Container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrailPrimaryHeaderContainer(
              child: Column(
                children: [
                  TrailHomeAppBar()
              ],
            )),
          ],
        ),
      ),
    );
  }
}
