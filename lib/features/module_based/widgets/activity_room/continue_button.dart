import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/assets/_font.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("vbvbbvvvb");
      },
      borderRadius: BorderRadius.circular(10.w),
      child: Container(
        height: 50.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.blueGray,
            borderRadius: BorderRadius.circular(10.w)),
        child: Text(
          "Continue",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w300,
              fontFamily: AppFonts.aeonik.name),
        ),
      ),
    );
  }
}
