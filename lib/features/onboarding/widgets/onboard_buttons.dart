import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';

////Onboarding start journey page button UI
class StartJourneyButton extends StatelessWidget {
  VoidCallback onTap;
  StartJourneyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      width: 120.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: AppColors.blueGray, borderRadius: BorderRadius.circular(30.w)),
      child: InkWell(
          onTap: () => onTap(),
          child: Text(
            "Start Journey",
            style: TextStyle(
              color: AppColors.white,
            ),
          )),
    );
  }
}

//Onboarding next page button UI
class OnboardNextButton extends StatelessWidget {
  VoidCallback onTap;
  OnboardNextButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      width: 60.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: AppColors.blueGray, borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () => onTap(),
        child: Icon(
          Icons.skip_next,
          size: 30,
          color: AppColors.white,
        ),
      ),
    );
  }
}

//Onboarding previous page button UI
class OnboardBackButton extends StatelessWidget {
  VoidCallback onTap;
  OnboardBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      width: 60.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: AppColors.blueGray, borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () => onTap(),
        child: Icon(
          Icons.skip_previous,
          size: 30,
          color: AppColors.white,
        ),
      ),
    );
  }
}
