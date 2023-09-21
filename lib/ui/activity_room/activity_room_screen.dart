import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

class ActivityRoomScreen extends StatelessWidget {
  const ActivityRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15.w)),
                  height: 15.h,
                  width: double.infinity,
                ),
                Container(
                  height: 15.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 70,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.deepOrange]),
                      borderRadius: BorderRadius.circular(15.w)),
                ),
              ],
            ),
            // SizedBox(
            //   height: 100.h,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Container(
            //       height: 50.h,
            //       width: 120.w,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(30.w),
            //           border: Border.all(color: Colors.orange, width: 3)),
            //       child: Text(
            //         "Back",
            //         style: TextStyle(
            //             color: Colors.orange,
            //             fontSize: 18.sp,
            //             fontFamily: 'Roboto',
            //             fontWeight: FontWeight.w400),
            //       ),
            //     ),
            //     Container(
            //       height: 50.h,
            //       width: 120.w,
            //       alignment: Alignment.center,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(30.w),
            //           gradient: LinearGradient(
            //               begin: Alignment.topCenter,
            //               end: Alignment.bottomCenter,
            //               colors: [Colors.orange, Colors.deepOrange])),
            //       child: Text(
            //         "Next",
            //         style: TextStyle(
            //             color: AppColors.white,
            //             fontSize: 18.sp,
            //             fontFamily: 'Roboto',
            //             fontWeight: FontWeight.w400),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50.h,
                  width: 120.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.w),
                      border: Border.all(color: Colors.orange, width: 3)),
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 120.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.w),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.amber,
                            Colors.orange,
                            Colors.deepOrange
                          ])),
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
