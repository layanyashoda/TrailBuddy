import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/Primary_Header_Container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrailPrimaryHeaderContainer(
              child: Container()
            ),
          ],
        ),
      ),
    );
  }
}

