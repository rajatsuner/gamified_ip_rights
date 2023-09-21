import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/styles.dart';

class BadgesList extends StatelessWidget {
  const BadgesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Badges",
          style: AppStyles.profileTags,
        ),
        SizedBox(
          height: 15.h,
        ),
        Wrap(
          runSpacing: 10.h,
          spacing: 40.w / 3,
          children: [
            Image.asset(
              "assets/images/badges/1.png",
              width: 70.w,
            ),
            Image.asset(
              "assets/images/badges/2.png",
              width: 70.w,
            ),
            Image.asset(
              "assets/images/badges/3.png",
              width: 70.w,
            ),
            Image.asset(
              "assets/images/badges/6.png",
              width: 70.w,
            ),
            Image.asset(
              "assets/images/badges/saturn.png",
              width: 70.w,
            ),
            Image.asset(
              "assets/images/badges/5.png",
              width: 70.w,
            ),
            Image.asset(
              "assets/images/badges/mars.png",
              width: 70.w,
            ),
            Image.asset(
              "assets/images/badges/venus.png",
              width: 70.w,
            ),
            Image.asset(
              "assets/images/badges/uranus.png",
              width: 70.w,
            ),
            Image.asset(
              "assets/images/badges/4.png",
              width: 70.w,
            ),
          ],
        ),
      ],
    );
  }
}

//  Text(
//           "Certificates",
//           style: TextStyle(
//               color: AppColors().white,
//               fontFamily: 'Aeonik',
//               letterSpacing: -0.5,
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w300),
//         ),