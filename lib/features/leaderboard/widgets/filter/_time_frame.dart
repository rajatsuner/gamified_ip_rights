import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/core/value/enums.dart';
import 'package:gamified_ip_rights/features/leaderboard/controller/leaderboard_controller.dart';
import 'package:gamified_ip_rights/features/leaderboard/controller/leaderboard_providers.dart';

class TimeFrameSelector extends ConsumerWidget {
  const TimeFrameSelector({super.key});

  _changeRange(WidgetRef ref, LeaderFilterType filter) {
    ref.read(leaderboardControllerProvider.notifier).changeFilterType(filter);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LeaderFilterType currentFilter = ref.watch(leaderboardFilterProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20.w),
          onTap: () => _changeRange(ref, LeaderFilterType.daily),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            height: 40.h,
            decoration: BoxDecoration(
                color: currentFilter == LeaderFilterType.daily
                    ? AppColors.blueGray
                    : Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.w)),
            child: Text(
              "Daily",
              style: TextStyle(
                  color: currentFilter == LeaderFilterType.daily
                      ? AppColors.white
                      : AppColors.black),
            ),
          ),
        ),
        InkWell(
          onTap: () => _changeRange(ref, LeaderFilterType.weekly),
          borderRadius: BorderRadius.circular(20.w),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
            height: 40.h,
            decoration: BoxDecoration(
                color: currentFilter == LeaderFilterType.weekly
                    ? AppColors.blueGray
                    : Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.w)),
            child: Text(
              "Weekly",
              style: TextStyle(
                  color: currentFilter == LeaderFilterType.weekly
                      ? AppColors.white
                      : AppColors.black),
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(20.w),
          onTap: () => _changeRange(ref, LeaderFilterType.monthly),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
            height: 40.h,
            decoration: BoxDecoration(
                color: currentFilter == LeaderFilterType.monthly
                    ? AppColors.blueGray
                    : Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20.w)),
            child: Text(
              "Monthly",
              style: TextStyle(
                  color: currentFilter == LeaderFilterType.monthly
                      ? AppColors.white
                      : AppColors.black),
            ),
          ),
        ),
      ],
    );
  }
}
