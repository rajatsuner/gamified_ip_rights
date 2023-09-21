import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';
import 'package:gamified_ip_rights/global/styles/styles.dart';
import 'package:gamified_ip_rights/ui/profile/widgets/_badges.dart';
import 'package:gamified_ip_rights/ui/profile/widgets/_certifications.dart';
import 'package:gamified_ip_rights/ui/profile/widgets/_game_stats.dart';

import 'package:lottie/lottie.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    print("REBUILD Profile");
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
              letterSpacing: 0.2,
              fontFamily: 'Aeonik',
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              height: 1,
              color: AppColors.grey.withOpacity(0.3),
            )),
        actions: [
          Icon(
            Icons.settings_outlined,
            color: AppColors.black,
          ),
          SizedBox(
            width: 15,
          )
        ],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.white.withOpacity(0.5),
              Colors.grey.withOpacity(0.1),
            ])),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Container(
                  height: 80.w,
                  width: 80.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.purple),
                  child: Image.asset('assets/icons/profile.png'),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  "Rajat Suner",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: AppColors.black,
                      fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        color: AppColors.blueGray,
                        borderRadius: BorderRadius.circular(10.w)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LottieBuilder.asset(
                          "assets/lotties/streak_icon.json",
                          height: 30.h,
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Aeonik',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "DAYS STREAK",
                          style: TextStyle(
                              color: AppColors.white.withOpacity(0.7),
                              fontFamily: 'Aeonik',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        color: AppColors.blueGray,
                        borderRadius: BorderRadius.circular(10.w)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/icons/flash.png",
                          height: 30.h,
                        ),
                        Text(
                          "90",
                          style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Aeonik',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "RIGHTS",
                          style: TextStyle(
                              color: AppColors.white.withOpacity(0.7),
                              fontFamily: 'Aeonik',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        color: AppColors.blueGray,
                        borderRadius: BorderRadius.circular(10.w)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/icons/noob.png",
                          height: 35.h,
                        ),
                        Text(
                          "Noobie",
                          style: TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Aeonik',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "LEAGUE",
                          style: TextStyle(
                              color: AppColors.white.withOpacity(0.7),
                              fontFamily: 'Aeonik',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              GameStatsList(),
              SizedBox(
                height: 30.h,
              ),
              BadgesList(),
              SizedBox(
                height: 30.h,
              ),
              CertificationsList(),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
