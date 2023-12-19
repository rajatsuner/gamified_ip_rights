import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/common/repository/api_repo.dart';
import 'package:gamified_ip_rights/features/user_progress/model/level_progress_model.dart';

final moduleRepoProvider = Provider((ref) => ModuleRepository(ref: ref));

class ModuleRepository {
  Ref _ref;
  ModuleRepository({required Ref ref}) : _ref = ref;

  Future<List<List<LevelProgressModel>>> getModuleProgress(
      String userId) async {
    List<List<LevelProgressModel>> list = [];
    try {
      Response response =
          await _ref.read(apiRepoProvider).getModuleProgress(userId);
      Map<String, dynamic> dataMap = response.data;

      ["ipInfo", "patentInfo", "trademarkInfo", "copyrightInfo", "designInfo"]
          .forEach((element) {
        print(element);
        list.add((dataMap["response"][element] as List)
            .map((e) => LevelProgressModel(
                status: e["status"], pointsEarned: e["pointsEarned"]))
            .toList());
      });
      print(dataMap.keys);
      return list;
    } on Exception catch (e) {
      return list;
    }

    return list;
  }
}
