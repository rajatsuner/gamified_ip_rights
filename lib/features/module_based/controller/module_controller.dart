import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/features/module_based/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/models/level_model.dart';
import 'package:gamified_ip_rights/features/module_based/models/module_model.dart';
import 'package:gamified_ip_rights/features/module_based/module_data.dart';
import 'package:gamified_ip_rights/features/module_based/providers/lifeline_providers.dart';

final moduleControllerProvider = StateNotifierProvider<ModuleController, bool>(
    (ref) => ModuleController(true, ref: ref));

class ModuleController extends StateNotifier<bool> {
  Ref _ref;
  ModuleController(super._state, {required Ref ref}) : _ref = ref {}
  getModules() {
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
                  isLocked: true))
              .toList()));
    });
    _ref.read(modulesProvider.notifier).update((state) => moduleList);
  }

  decreaseLifeline() {
    _ref.read(lifelineProvider.notifier).decrease();
  }
}
