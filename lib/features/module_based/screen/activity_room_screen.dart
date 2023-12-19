import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/assets/_font.dart';
import 'package:gamified_ip_rights/core/assets/_icons.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/acitvity_area.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/continue_button.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/current_question_point.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/lifeline_bar.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/progress_bar.dart';

class ActivityRoomScreen extends StatelessWidget {
  const ActivityRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.close,
          size: 30.w,
        ),
        //  title: LifelineBar(),
        automaticallyImplyLeading: true,
        surfaceTintColor: AppColors.deepBlue,
        elevation: 1,
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(15.h), child: ProgressBar()),
        //  actions: [CurrentQuestionPoint()],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ActivityArea(), ContinueButton()],
        ),
      ),
    );
  }
}
