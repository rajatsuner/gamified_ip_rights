import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';
import 'package:gamified_ip_rights/global/styles/styles.dart';

import 'package:lottie/lottie.dart';

class GameStatsList extends StatelessWidget {
  const GameStatsList({super.key});

  _statsItem(String count, String type) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.h),
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
          color: AppColors.blueGray, borderRadius: BorderRadius.circular(10.w)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            count,
            style: TextStyle(
                color: AppColors.white,
                fontFamily: 'Aeonik',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            type,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.white.withOpacity(0.7),
                fontFamily: 'Aeonik',
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Statistics",
          style: AppStyles.profileTags,
        ),
        SizedBox(
          height: 15.h,
        ),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: [
            _statsItem("10", "Correct Answer"),
            _statsItem("6", "Wrong Answer"),
            _statsItem("454", "Minutes"),
            _statsItem('80%', "Accuracy"),
            _statsItem("10", "Maximum Streak"),
            _statsItem("0", "Patent Filing"),
            _statsItem("0", "Copyright Filing"),
            _statsItem("0", "Trademark Filing"),
            _statsItem("0", "Design Filing"),
          ],
        )
      ],
    );
  }
}
