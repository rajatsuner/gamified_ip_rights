import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';

class MoreStuffSection extends StatelessWidget {
  const MoreStuffSection({super.key});

  @override
  Widget build(BuildContext context) {
    print("REBUILD More");
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: Text(
          "Treasure",
          style: TextStyle(
              letterSpacing: 0.2,
              fontFamily: 'Aeonik',
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(color: AppColors.blueGray, width: 1)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/museum.png',
                    height: 200.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Virutal Museum",
                    style: TextStyle(
                        fontFamily: 'Aeonik',
                        fontWeight: FontWeight.w500,
                        color: AppColors.blueGray,
                        fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Filing Simulation',
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: 'Aeonik',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 10.w,
              runSpacing: 10.h,
              runAlignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/patent.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Patent",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.deepBlue),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/trademark.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Trademark",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.deepBlue),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/copyright.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Copyright",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.deepBlue),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/design.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Design",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: AppColors.deepBlue),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Crafting Laboratory',
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: 'Aeonik',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 10.w,
              runSpacing: 10.h,
              runAlignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/patent.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Patent",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.deepBlue),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/trademark.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Trademark",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.deepBlue),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/copyright.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Copyright",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.deepBlue),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/design.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Design",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: AppColors.deepBlue),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Comification',
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: 'Aeonik',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -1,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 10.w,
              runSpacing: 10.h,
              runAlignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/patent.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Patent Comics",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.deepBlue),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/trademark.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Trademark Comics",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.deepBlue),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/copyright.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Copyright Comics",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.deepBlue),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140.w,
                  height: 140.h,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/design.png',
                        height: 80.h,
                        width: 80.w,
                      ),
                      Text(
                        "Design Comics",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color: AppColors.deepBlue),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
