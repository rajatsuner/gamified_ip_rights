import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/global/styles/colors.dart';
import 'package:gamified_ip_rights/ui/leaderboard/widgets/_app_bar.dart';
import 'package:gamified_ip_rights/ui/leaderboard/widgets/filter/_time_frame.dart';
import 'package:gamified_ip_rights/ui/leaderboard/widgets/list/_other_player_list.dart';
import 'package:gamified_ip_rights/ui/leaderboard/widgets/myrank/_my_rank_out_tile.dart';
import 'package:gamified_ip_rights/ui/leaderboard/widgets/podium/_leader_top_three.dart';
import 'package:lottie/lottie.dart';

class LeaderboardSection extends ConsumerWidget {
  const LeaderboardSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("REBUILD LEADERBOARD");
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        appBar: LeaderAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            children: [
              const TimeFrameSelector(),
              SizedBox(
                height: 30.h,
              ),
              const LeaderTopThree(),
              SizedBox(
                height: 20.h,
              ),
              const MyRankOutTile(),
              SizedBox(
                height: 20.h,
              ),
              const OtherPlayersList(),
            ],
          ),
        ));
  }
}
