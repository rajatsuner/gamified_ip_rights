import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/auth/controller/_providers.dart';
import 'package:gamified_ip_rights/features/auth/model/user_model.dart';
import 'package:gamified_ip_rights/features/leaderboard/controller/leaderboard_providers.dart';
import 'package:gamified_ip_rights/features/leaderboard/model/leader_player_model.dart';

import 'package:lottie/lottie.dart';

class OtherPlayersList extends ConsumerWidget {
  const OtherPlayersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<LeaderPlayerModel> playerList = ref.watch(leaderboardListProvider);
    UserModel currentUser = ref.watch(userModelProvider)!;
    return playerList.length > 3
        ? ListView.separated(
            separatorBuilder: (context, index) => Divider(
              indent: 5.w,
              endIndent: 5.w,
            ),
            shrinkWrap: true,
            itemCount: playerList.length - 3,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: playerList[index + 3].userId == "S110"
                        ? Colors.deepPurpleAccent
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(5.w)),
                height: 50.h,
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${playerList[index + 3].rank}",
                        style: TextStyle(
                            color: playerList[index + 3].userId == "S110"
                                ? Colors.white
                                : AppColors.deepBlue,
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
                            "${playerList[index + 3].userName}",
                            style: TextStyle(
                                color: playerList[index + 3].userId == "S110"
                                    ? Colors.white
                                    : AppColors.black,
                                fontSize: 14.sp),
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
                            "${playerList[index + 3].points}",
                            style: TextStyle(
                                color: playerList[index + 3].userId == "S110"
                                    ? AppColors.white
                                    : AppColors.deepBlue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : const SizedBox(
            width: 1,
            height: 1,
          );
  }
}
