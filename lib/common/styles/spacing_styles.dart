import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class TrailSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TrailSizes.appBarHeight,
    left: TrailSizes.defaultSpace,
    bottom: TrailSizes.defaultSpace,
    right: TrailSizes.defaultSpace,
  );
}