import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/core/router.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s1_micro.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s2_micro.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s3_micro.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s4_micro.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s5_micro.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s6_micro.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s7_micro.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/activity_room/m1_l1/s8_mcqtext.dart';

final activityControllerProvider =
    StateNotifierProvider((ref) => ActivityController(true, ref: ref));

class ActivityController extends StateNotifier<bool> {
  Ref _ref;
  ActivityController(super.state, {required Ref ref}) : _ref = ref;

  loadActivityData() {
    List<Widget> tasksList = [
      S1Micro(),
      S2Micro(),
      S3Micro(),
      S4Micro(),
      S5Micro(),
      S6Micro(),
      S7Micro(),
      S8McqText(),
    ];
    _ref.read(levelContentProvider.notifier).update((state) => tasksList);
    _ref.read(currentSubtaskNumber.notifier).update((state) => 0);
  }

  nextTask(BuildContext context) {
    _ref.read(continueProvider.notifier).update((state) => false);
    int totalTaskNumber = _ref.read(levelContentProvider).length;
    int currentTaskNumber = _ref.read(currentSubtaskNumber);
    if ((currentTaskNumber + 1) < totalTaskNumber) {
      _ref.read(currentSubtaskNumber.notifier).update((state) => state + 1);
    } else {
      Navigator.pushNamed(context, AppRoute.activitySummary.path);
    }
  }
}
