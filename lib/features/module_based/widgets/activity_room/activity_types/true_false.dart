import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/assets/_font.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';

class TrueFalse extends StatelessWidget {
  const TrueFalse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Mahatma Gandhi is the father of our country ?",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 20.w),
          height: 50.h,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 2.w),
              borderRadius: BorderRadius.circular(10.w)),
          child: Text(
            "True",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.aeonik.name),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 20.w),
          height: 50.h,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey, width: 2.w),
              borderRadius: BorderRadius.circular(10.w)),
          child: Text(
            "False",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.aeonik.name),
          ),
        ),
      ],
    );
  }
}
