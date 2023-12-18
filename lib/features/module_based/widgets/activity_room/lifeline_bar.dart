import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/assets/_icons.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/controller/module_controller.dart';
import 'package:gamified_ip_rights/features/module_based/providers/lifeline_providers.dart';

class LifelineBar extends ConsumerWidget {
  const LifelineBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int lifelineAvailable = ref.watch(lifelineProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...[1, 2, 3, 4, 5]
            .map(
              (number) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Image.asset(
                  number <= (5 - lifelineAvailable)
                      ? AppIcons.blackHeart.path
                      : AppIcons.redHeart.path,
                  height: 25.h,
                ),
              ),
            )
            .toList()
      ],
    );
  }
}
