import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/core/router.dart';
import 'package:gamified_ip_rights/features/auth/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/controller/activity_controller.dart';
import 'package:gamified_ip_rights/features/module_based/models/level_model.dart';
import 'package:gamified_ip_rights/features/module_based/models/module_model.dart';
import 'package:gamified_ip_rights/common/data/module_data.dart';
import 'package:gamified_ip_rights/features/module_based/providers/lifeline_providers.dart';
import 'package:gamified_ip_rights/features/module_based/repository/module_repository.dart';
import 'package:gamified_ip_rights/features/user_progress/model/level_progress_model.dart';

final moduleControllerProvider = StateNotifierProvider<ModuleController, bool>(
    (ref) => ModuleController(true, ref: ref));

class ModuleController extends StateNotifier<bool> {
  Ref _ref;
  ModuleController(super._state, {required Ref ref}) : _ref = ref {}

  getModules() async {
    List<ModuleModel> moduleList = [];
    moduleData.forEach((eachModuleData) {
      moduleList.add(ModuleModel(
          moduleName: eachModuleData["moduleName"] as String,
          moduleNumber: eachModuleData["moduleNumber"] as int,
          levels: (eachModuleData["levels"] as List)
              .map((level) => LevelModel(
                    moduleNumber: eachModuleData["moduleNumber"] as int,
                    levelNumber: level["levelNumber"] as int,
                    levelName: level["levelName"] as String,
                    maxPoints: level["maxPoints"] as int,
                  ))
              .toList()));
    });
    List<List<LevelProgressModel>> list = await getModuleProgress();
    for (var i = 0; i < 5; i++) {
      List<LevelModel> newLevelList = [];
      for (var j = 0; j < 3; j++) {
        newLevelList.add(LevelModel(
            moduleNumber: moduleList[i].levels[j].moduleNumber,
            levelNumber: moduleList[i].levels[j].levelNumber,
            levelName: moduleList[i].levels[j].levelName,
            maxPoints: moduleList[i].levels[j].maxPoints,
            status: list[i][j].status,
            scoredPoints: list[i][j].pointsEarned));
      }

      moduleList[i].levels = newLevelList;
    }
    _ref.read(modulesListProvider.notifier).update((state) => moduleList);
    printModule();
  }

  decreaseLifeline() {
    _ref.read(lifelineProvider.notifier).decrease();
  }

  printModule() {
    List<ModuleModel> list = _ref.read(modulesListProvider);
    for (var element in list) {}
  }

  Future<List<List<LevelProgressModel>>> getModuleProgress() async {
    String userId = _ref.read(userModelProvider)!.userId;
    List<List<LevelProgressModel>> list =
        await _ref.read(moduleRepoProvider).getModuleProgress(userId);
    return list;
  }

  startLevel(BuildContext context, LevelModel levelModel) {
    print("Start level M${levelModel.moduleNumber} L${levelModel.levelNumber}");
    Navigator.pushNamed(context, AppRoute.activityLoading.path);
    _ref.read(activityControllerProvider.notifier).loadActivityData();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoute.activityRoom.path);
    });
  }
}
