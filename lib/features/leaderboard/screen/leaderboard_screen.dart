import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/common/repository/api_repo.dart';
import 'package:gamified_ip_rights/core/assets/_lottie.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/leaderboard/controller/leaderboard_controller.dart';
import 'package:gamified_ip_rights/features/leaderboard/controller/leaderboard_providers.dart';
import 'package:gamified_ip_rights/features/leaderboard/model/leader_player_model.dart';

import 'package:gamified_ip_rights/features/leaderboard/widgets/filter/_time_frame.dart';
import 'package:gamified_ip_rights/features/leaderboard/widgets/list/_other_player_list.dart';
import 'package:lottie/lottie.dart';

import '../widgets/myrank/_my_rank_out_tile.dart';
import '../widgets/podium/_leader_top_three.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  ConsumerState<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    LeaderPlayerModel? myRank = ref.watch(myRankProvider);
    List<LeaderPlayerModel> playerList = ref.watch(leaderboardListProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        //Colors.grey.withOpacity(0.1),
        appBar: AppBar(
          title: Text(
            "Leaderboard",
            style: TextStyle(
                letterSpacing: 0.2,
                fontFamily: 'Aeonik',
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(
                height: 1,
                color: AppColors.grey.withOpacity(0.3),
              )),
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: IconButton(
                  onPressed: () {
                    ref
                        .read(leaderboardControllerProvider.notifier)
                        .getLeaderboardData();
                  },
                  icon: Icon(
                    Icons.refresh,
                    size: 30.sp,
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              const TimeFrameSelector(),
              SizedBox(
                height: 30.h,
              ),
              const LeaderTopThree(),
              if (myRank != null)
                SizedBox(
                  height: 20.h,
                ),
              if (myRank != null) const MyRankOutTile(),
              SizedBox(
                height: 20.h,
              ),
              playerList.isNotEmpty
                  ? const OtherPlayersList()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LottieBuilder.asset(AppLottie.leaderboardLoading.path),
                        Text("Leaderboard Loading")
                      ],
                    ),
            ],
          ),
        ));
  }
}
