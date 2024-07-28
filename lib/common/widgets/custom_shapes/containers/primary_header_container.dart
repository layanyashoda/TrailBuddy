import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class TrailPrimaryHeaderContainer extends StatelessWidget {
  const TrailPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TrailCurvedEdgeWidget(
      child: Container(
        color: TrailColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(top: -150, right: -250, child:  TrailCircularContainer(backgroundColor: TrailColors.textWhite.withOpacity(0.1))),
              Positioned(top: 100, right: -300, child:  TrailCircularContainer(backgroundColor: TrailColors.textWhite.withOpacity(0.1))),
            ],
          ),
        ),
      ),
    );
  }
}