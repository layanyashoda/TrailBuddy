import 'package:flutter/material.dart';

import 'curved_edges.dart';

class TrailCurvedEdgeWidget extends StatelessWidget {
  const TrailCurvedEdgeWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TrailCustomCurvedEdges(),
      child: child,
    );
  }
}

