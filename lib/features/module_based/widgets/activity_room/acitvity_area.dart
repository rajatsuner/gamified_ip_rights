import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/activity_types/image_mcq.dart';

import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/activity_types/true_false.dart';

class ActivityArea extends StatelessWidget {
  const ActivityArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      alignment: Alignment.topLeft,
      //color: Colors.grey.withOpacity(0.1),
      child: ImageMCQ(),
    );
  }
}
