import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/assets/_font.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';

class ImageMCQ extends StatelessWidget {
  const ImageMCQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Which one of following is correct adidas logo ?",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 130.w,
              height: 120.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.05),
                  border: Border.all(color: AppColors.grey, width: 2.w),
                  borderRadius: BorderRadius.circular(5.w)),
              child: Image.asset('assets/images/copyright.png'),
            ),
            ImageOption(imageName: "imageName")
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 130.w,
              height: 120.h,
              decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.05),
                  border: Border.all(color: AppColors.grey, width: 2.w),
                  borderRadius: BorderRadius.circular(5.w)),
            ),
            Container(
              width: 130.w,
              height: 120.h,
              decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.05),
                  border: Border.all(color: AppColors.grey, width: 2.w),
                  borderRadius: BorderRadius.circular(5.w)),
            )
          ],
        ),
      ],
    );
  }
}

class ImageOption extends StatelessWidget {
  String imageName;
  ImageOption({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 120.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.05),
          border: Border.all(color: AppColors.grey, width: 2.w),
          borderRadius: BorderRadius.circular(5.w)),
      child: Image.asset('assets/images/copyright.png'),
    );
  }
}
