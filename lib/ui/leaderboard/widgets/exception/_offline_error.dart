import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

import 'package:lottie/lottie.dart';

class LeaderboardOfflineError extends StatelessWidget {
  const LeaderboardOfflineError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            "assets/images/off.json",
            width: 180.w,
          ),
          Text(
            "Looks like you are offline",
            style: TextStyle(
                color: AppColors.white,
                fontFamily: 'Aeonik',
                fontWeight: FontWeight.bold,
                fontSize: 18.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Connect to the internet to\nuse Weekly Dashboard",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.white.withOpacity(0.8),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w100),
          )
        ],
      ),
    );
  }
}
