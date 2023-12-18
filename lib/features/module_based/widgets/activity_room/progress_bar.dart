import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          height: 10.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: AppColors.purple,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          height: 10.h,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: AppColors.blueGray,
          ),
        ),
      ],
    );
  }
}
