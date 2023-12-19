import 'package:dio/src/response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/common/repository/api_repo.dart';
import 'package:gamified_ip_rights/core/assets/_icons.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/auth/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/controller/module_controller.dart';
import 'package:gamified_ip_rights/features/module_based/models/module_model.dart';
import 'package:gamified_ip_rights/features/module_based/widgets/map_of_progress/section_tab.dart';
import 'package:gamified_ip_rights/features/user_progress/controller/user_progress_controller.dart';

class MapOfProgressScreen extends ConsumerStatefulWidget {
  const MapOfProgressScreen({super.key});

  @override
  ConsumerState<MapOfProgressScreen> createState() =>
      _MapOfProgressScreenState();
}

class _MapOfProgressScreenState extends ConsumerState<MapOfProgressScreen> {
  _getModulesLoad(WidgetRef ref) {
    ref.read(moduleControllerProvider.notifier).getModules();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getModulesLoad(ref);
  }

  @override
  Widget build(BuildContext context) {
    List<ModuleModel> moduleList = ref.watch(modulesListProvider);

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(AppIcons.logo.path),
        title: InkWell(
          onTap: () async {
            // ref.read(userProgressController.notifier).getUserProgress();
            // ref.read(moduleControllerProvider.notifier).getModuleProgress();
            // Response r = await ref
            //     .read(apiRepoProvider)
            //     .getModuleProgress(ref.read(userModelProvider)!.userId);
            // print(r.data);
            _getModulesLoad(ref);
          },
          child: Text(
            "Idea-Fi",
            style: TextStyle(
                letterSpacing: 0.1,
                fontFamily: 'Aeonik',
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
        elevation: 0,
        surfaceTintColor: AppColors.deepBlue,
      ),
      body: moduleList.isEmpty
          ? Center(
              child: Text("Loading"),
            )
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    ...moduleList
                        .map((module) => Padding(
                              padding: EdgeInsets.only(top: 40.h),
                              child: SectionTab(
                                  sectionNumber: module.moduleNumber,
                                  sectionName: module.moduleName,
                                  progress: getProgress(module)),
                            ))
                        .toList()
                  ],
                ),
              ),
            ),
    );
  }

  double getProgress(ModuleModel module) {
    int completed = 0;
    for (var level in module.levels) {
      if (level.status == "Completed") {
        completed++;
      }
    }
    return (completed * 100 / 3);
  }
}

// class SectionMapOfProgress extends StatelessWidget {
//   int sectionNum;
//   int totalLevels;
//   SectionMapOfProgress(
//       {Key? key, required this.sectionNum, required this.totalLevels})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> levels = [];
//     for (var i = 1; i <= totalLevels; i++) {
//       if (sectionNum == 1 && i == 1) {
//         levels.add(SectionOneLevelOne());
//       } else if (sectionNum == 1 && i == 2) {
//         levels.add(SectionOneLevelTwo());
//       } else {
//         levels.add(LevelWidget(levelNumber: i, sectionNum: sectionNum));
//       }
//     }

//     return Container(
//       // height: 400,
//       padding: EdgeInsets.only(left: 20.w, right: 20.w),
//       width: double.infinity,
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start, children: [...levels]
//           // [
//           // Container(
//           //   width: 10.w,
//           //   height: 400,
//           //   color: Colors.grey,
//           // )

//           // ],
//           ),
//     );
//   }
// }

// // class LevelWidget extends StatelessWidget {
// //   int levelNumber, sectionNum;
//   LevelWidget({super.key, required this.levelNumber, required this.sectionNum});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
//       child: levelNumber % 2 != 0
//           ? Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 60.h,
//                   width: 60.h,
//                   padding: EdgeInsets.all(10.w),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: AppColors.grey, width: 5.w)),
//                   child: Image.asset(
//                     'assets/images/padlock.png',
//                   ),
//                 ),
//                 Container(
//                   width: 100.h,
//                   height: 50.h,
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "  Level $levelNumber",
//                   ),
//                 ),
//               ],
//             )
//           : Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 100.h,
//                   height: 50.h,
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "Level $levelNumber  ",
//                   ),
//                 ),
//                 Container(
//                   height: 60.h,
//                   width: 60.h,
//                   padding: EdgeInsets.all(10.w),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: AppColors.grey, width: 5.w)),
//                   child: Image.asset(
//                     'assets/images/padlock.png',
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

// class SectionOneLevelOne extends StatelessWidget {
//   const SectionOneLevelOne({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             height: 60.h,
//             width: 60.h,
//             padding: EdgeInsets.all(5.w),
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: AppColors.violet, width: 5.w)),
//             child: Image.asset(
//               'assets/images/star.png',
//             ),
//           ),
//           SizedBox(
//             width: 10.w,
//           ),
//           Container(
//               width: 200.h,
//               height: 50.h,
//               padding: EdgeInsets.only(left: 10.w, right: 5.w),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(20.w),
//                       bottomRight: Radius.circular(20.w))),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "What the IP",
//                     style: TextStyle(fontWeight: FontWeight.w800),
//                   ),
//                   Row(
//                     children: [
//                       Image.asset(
//                         'assets/icons/flash.png',
//                         height: 20.h,
//                       ),
//                       Text("(0/80)"),
//                     ],
//                   )
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }

// class SectionOneLevelTwo extends StatelessWidget {
//   const SectionOneLevelTwo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//               width: 200.h,
//               height: 50.h,
//               padding: EdgeInsets.only(left: 5.w, right: 10.w),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20.w),
//                       bottomLeft: Radius.circular(20.w))),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(
//                         'assets/icons/flash.png',
//                         height: 20.h,
//                       ),
//                       Text("(0/50)"),
//                     ],
//                   ),
//                   Text(
//                     "Visualise the IP",
//                     style: TextStyle(fontWeight: FontWeight.w800),
//                   ),
//                 ],
//               )),
//           SizedBox(
//             width: 10.w,
//           ),
//           Container(
//             height: 60.h,
//             width: 60.h,
//             padding: EdgeInsets.all(5.w),
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: AppColors.violet, width: 5.w)),
//             child: Image.asset(
//               'assets/images/star.png',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
