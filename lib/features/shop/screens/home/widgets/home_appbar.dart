import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/notifications/notification_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class TrailHomeAppBar extends StatelessWidget {
  const TrailHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TrailAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TrailTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: TrailColors.grey)),
          Text(TrailTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TrailColors.white)),
        ],
      ),
      actions: [
        TrailNotificationIcon(onPressed: () {}, iconColor: TrailColors.white),
      ],
    );
  }
}

