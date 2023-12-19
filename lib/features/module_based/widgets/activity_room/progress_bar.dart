import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';

class ProgressBar extends ConsumerWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSubTaskNumber = ref.watch(currentSubtaskNumber);
    final totalSubTaskNumber = ref.read(levelContentProvider).length;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          height: 10.h,
          width: 340.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: AppColors.purple,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          height: 10.h,
          width: (currentSubTaskNumber / totalSubTaskNumber) * 340.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: AppColors.blueGray,
          ),
        ),
      ],
    );
  }
}
