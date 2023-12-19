import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/assets/_font.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/controller/activity_controller.dart';

class ContinueButton extends ConsumerWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isContinueEnable = ref.watch(continueProvider);
    return InkWell(
      onTap: () {
        if (!isContinueEnable) {
          return;
        }
        ref.read(activityControllerProvider.notifier).nextTask(context);
      },
      borderRadius: BorderRadius.circular(10.w),
      child: isContinueEnable
          ? Container(
              height: 50.h,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.blueGray,
                  borderRadius: BorderRadius.circular(10.w)),
              child: Text(
                "Continue",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: AppFonts.aeonik.name),
              ),
            )
          : Container(
              height: 50.h,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.blueGray.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.w)),
              child: Text(
                "Continue",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: AppFonts.aeonik.name),
              ),
            ),
    );
  }
}
