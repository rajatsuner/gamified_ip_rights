import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

class MyRankOutTile extends StatelessWidget {
  const MyRankOutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(30.w)),
      height: 50.h,
      padding: EdgeInsets.only(left: 20.w, right: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "80",
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/profile.png",
                  height: 30.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Rajat Suner",
                  style: TextStyle(color: AppColors.white, fontSize: 14.sp),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/icons/flash.png",
                  height: 20.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "0",
                  style: TextStyle(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
