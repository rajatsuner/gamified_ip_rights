import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

import 'package:lottie/lottie.dart';

class OtherPlayersList extends StatelessWidget {
  const OtherPlayersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        indent: 5.w,
        endIndent: 5.w,
      ),
      shrinkWrap: true,
      itemCount: 47,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(5.w)),
          height: 50.h,
          padding: EdgeInsets.only(left: 20.w, right: 10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "${index + 4}",
                  style: TextStyle(
                      color: AppColors.deepBlue,
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
                      "Player ${index + 4} Name",
                      style: TextStyle(color: AppColors.black, fontSize: 14.sp),
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
                      "${1000 - index * 10}",
                      style: TextStyle(color: AppColors.deepBlue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
