import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

class TimeFrameSelector extends StatelessWidget {
  const TimeFrameSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.blueGray,
              borderRadius: BorderRadius.circular(20.w)),
          child: Text(
            "Daily",
            style: TextStyle(color: AppColors.white),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20.w)),
          child: Text(
            "Weekly",
            style: TextStyle(color: AppColors.black),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
          height: 40.h,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20.w)),
          child: Text(
            "Monthly",
            style: TextStyle(color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
