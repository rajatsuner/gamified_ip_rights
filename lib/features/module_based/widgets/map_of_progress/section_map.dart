import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/models/module_model.dart';
import 'package:gamified_ip_rights/features/module_based/screen/map_of_progress_screen.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/map_of_progress/level_widget.dart';

class SectionMapOfProgress extends ConsumerWidget {
  int sectionNum;

  SectionMapOfProgress({Key? key, required this.sectionNum}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ModuleModel> moduleList = ref.watch(modulesListProvider);
    ModuleModel module =
        moduleList.firstWhere((element) => element.moduleNumber == sectionNum);

    List<Widget> levels = [];
    for (var i = 1; i <= module.levels.length; i++) {
      levels.add(LevelWidget(levelNumber: i, sectionNum: sectionNum));
    }

    return Container(
      // height: 400,
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [...levels]
          // [
          // Container(
          //   width: 10.w,
          //   height: 400,
          //   color: Colors.grey,
          // )

          // ],
          ),
    );
  }
}
