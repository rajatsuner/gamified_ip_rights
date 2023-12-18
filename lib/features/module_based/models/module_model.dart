// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gamified_ip_rights/features/module_based/models/level_model.dart';

class ModuleModel {
  String moduleName;
  int moduleNumber;
  List<LevelModel> levels;
  ModuleModel({
    required this.moduleName,
    required this.moduleNumber,
    required this.levels,
  });
}
