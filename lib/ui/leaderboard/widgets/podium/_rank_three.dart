import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';
import 'package:gamified_ip_rights/ui/leaderboard/widgets/podium/_leader_top_three.dart';

class RankThreePodium extends StatelessWidget {
  const RankThreePodium({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 80.w * 0.6,
            height: 80.w * 0.6,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/profile.png')),
                shape: BoxShape.circle,
                color: AppColors.blueGray,
                border: Border.all(
                    color: Color.fromARGB(255, 147, 95, 46), width: 3))),
        SizedBox(
          height: 10,
        ),
        Text(
          "Rishabh",
          style:
              TextStyle(color: AppColors.deepBlue, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 80 - 80 * 0.2,
          height: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.blueGray,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/flash.png",
                height: 20.h,
              ),
              Text(
                "1000",
                style: TextStyle(color: AppColors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 80,
          height: 100,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: ClipPath(
                  clipper: LeaderboardProfileClipper(),
                  child: Container(
                    width: 80,
                    height: 15,
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 147, 95, 46)),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                child: Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Color(0xFFC27D3E)),
                  child: Text(
                    "3",
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
