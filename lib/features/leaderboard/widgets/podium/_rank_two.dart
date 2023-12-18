import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/leaderboard/controller/leaderboard_providers.dart';
import 'package:gamified_ip_rights/features/leaderboard/model/leader_player_model.dart';
import 'package:gamified_ip_rights/features/leaderboard/widgets/podium/_leader_top_three.dart';

class RankTwoPodium extends ConsumerWidget {
  const RankTwoPodium({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<LeaderPlayerModel> playerList = ref.watch(leaderboardListProvider);
    return playerList.length < 2
        ? SizedBox(
            width: 90.w * 0.6,
            height: 90.w * 0.6,
          )
        : Column(
            children: [
              Container(
                  width: 90.w * 0.6,
                  height: 90.w * 0.6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icons/profile.png')),
                      shape: BoxShape.circle,
                      color: AppColors.blueGray,
                      border: Border.all(color: Color(0xffBBC2CC), width: 3))),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "${playerList[1].userName}",
                style: TextStyle(
                    color: AppColors.deepBlue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 90.w - 90.w * 0.2,
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
                      "${playerList[1].points}",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 90.w,
                height: 110.h,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: ClipPath(
                        clipper: LeaderboardProfileClipper(),
                        child: Container(
                          width: 90.w,
                          height: 15.h,
                          decoration: BoxDecoration(
                              color: Color((0xffBBC2CC)).withOpacity(0.8)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15.h,
                      child: Container(
                        width: 90.w,
                        height: 90.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Color(0xffBBC2CC)),
                        child: Text(
                          "2",
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
