import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/leaderboard/controller/leaderboard_providers.dart';
import 'package:gamified_ip_rights/features/leaderboard/model/leader_player_model.dart';

class MyRankOutTile extends ConsumerWidget {
  const MyRankOutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LeaderPlayerModel myRank = ref.watch(myRankProvider)!;
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(0.w)),
      height: 50.h,
      padding: EdgeInsets.only(left: 20.w, right: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "${myRank.rank}",
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
                  "${myRank.userName}",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14.sp,
                      overflow: TextOverflow.clip),
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
                  "${myRank.points}",
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
