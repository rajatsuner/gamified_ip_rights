import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';

class AppStyles {
  static TextStyle? get profileTags => TextStyle(
      color: AppColors.black,
      fontFamily: 'Aeonik',
      letterSpacing: -0.5,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400);

  static LinearGradient get buttonGradient => const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.amber, Colors.orange, Colors.deepOrange]);
}
