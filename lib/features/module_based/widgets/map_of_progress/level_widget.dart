import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gamified_ip_rights/core/styles/colors.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/controller/module_controller.dart';
import 'package:gamified_ip_rights/features/module_based/models/level_model.dart';
import 'package:gamified_ip_rights/features/module_based/models/module_model.dart';

class LevelWidget extends ConsumerWidget {
  int levelNumber, sectionNum;
  LevelWidget({super.key, required this.levelNumber, required this.sectionNum});

  _startLevel(BuildContext context, WidgetRef ref, LevelModel levelModel) {
    ref.read(moduleControllerProvider.notifier).startLevel(context, levelModel);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ModuleModel> moduleList = ref.watch(modulesListProvider);
    ModuleModel module =
        moduleList.firstWhere((element) => element.moduleNumber == sectionNum);

    LevelModel level = module.levels
        .firstWhere((element) => element.levelNumber == levelNumber);

    bool isCompleted = level.status == "Completed";
    int currentLevel = level.levelNumber;

    return isCompleted
        ? completedLevel(moduleList[sectionNum - 1].levels[levelNumber - 1])
        : (levelNumber == 1 ||
                (levelNumber == 2 &&
                    moduleList[sectionNum - 1].levels[0].status ==
                        "Completed") ||
                (levelNumber == 3 &&
                    moduleList[sectionNum - 1].levels[1].status == "Completed"))
            ? InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  _startLevel(context, ref,
                      moduleList[sectionNum - 1].levels[levelNumber - 1]);
                },
                child: unlockedLevel(
                    moduleList[sectionNum - 1].levels[levelNumber - 1]))
            : lockedLevel(moduleList[sectionNum - 1].levels[levelNumber - 1]);
  }

  //unlocked but not completed
  Widget unlockedLevel(LevelModel levelModel) {
    int levelNumber = levelModel.levelNumber;
    if (levelNumber % 2 != 0) {
      //left level
      return Container(
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.violet, width: 5.w)),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
                // width: 200.h,
                height: 50.h,
                padding: EdgeInsets.only(left: 10.w, right: 5.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.w),
                        bottomRight: Radius.circular(20.w))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${levelModel.levelName}",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/flash.png',
                          height: 20.h,
                        ),
                        Text(
                            "(${levelModel.scoredPoints}/${levelModel.maxPoints})"),
                      ],
                    )
                  ],
                )),
          ],
        ),
      );
    } else {
      //right level
      return Container(
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // width: 200.h,
                height: 50.h,
                padding: EdgeInsets.only(left: 5.w, right: 10.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.w),
                        bottomLeft: Radius.circular(20.w))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/flash.png',
                          height: 20.h,
                        ),
                        Text(
                            "(${levelModel.scoredPoints}/${levelModel.maxPoints})"),
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "${levelModel.levelName}",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.violet, width: 5.w)),
            ),
          ],
        ),
      );
    }
  }

  //locked level widget
  Widget lockedLevel(LevelModel levelModel) {
    int levelNumber = levelModel.levelNumber;
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: levelNumber % 2 != 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60.h,
                  width: 60.h,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey, width: 5.w)),
                  child: Image.asset(
                    'assets/images/padlock.png',
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 200.h,
                  height: 50.h,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${levelModel.levelName}",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200.h,
                  height: 50.h,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${levelModel.levelName}",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  height: 60.h,
                  width: 60.h,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.grey, width: 5.w)),
                  child: Image.asset(
                    'assets/images/padlock.png',
                  ),
                ),
              ],
            ),
    );
  }

  //completed level widget
  Widget completedLevel(LevelModel levelModel) {
    int levelNumber = levelModel.levelNumber;
    if (levelNumber % 2 != 0) {
      //left level
      return Container(
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.violet, width: 5.w)),
              child: Image.asset(
                'assets/images/star.png',
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
                // width: 200.h,
                height: 50.h,
                padding: EdgeInsets.only(left: 10.w, right: 5.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.w),
                        bottomRight: Radius.circular(20.w))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${levelModel.levelName}",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/flash.png',
                          height: 20.h,
                        ),
                        Text(
                            "(${levelModel.scoredPoints}/${levelModel.maxPoints})"),
                      ],
                    )
                  ],
                )),
          ],
        ),
      );
    } else {
      //right level
      return Container(
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // width: 200.h,
                height: 50.h,
                padding: EdgeInsets.only(left: 5.w, right: 10.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.w),
                        bottomLeft: Radius.circular(20.w))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/flash.png',
                          height: 20.h,
                        ),
                        Text(
                            "(${levelModel.scoredPoints}/${levelModel.maxPoints})"),
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "${levelModel.levelName}",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.violet, width: 5.w)),
              child: Image.asset(
                'assets/images/star.png',
              ),
            ),
          ],
        ),
      );
    }
  }
}
