import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/common/repository/api_repo.dart';
import 'package:gamified_ip_rights/features/user_progress/controller/_providers.dart';
import 'package:gamified_ip_rights/features/user_progress/model/level_progress_model.dart';
import 'package:gamified_ip_rights/features/user_progress/model/model_progress_model.dart';

final userProgressRepoProvider =
    Provider((ref) => UserProgressRepository(ref: ref));

class UserProgressRepository {
  Ref _ref;
  UserProgressRepository({required Ref ref}) : _ref = ref;

  Future<(List<ModuleProgressModel>, List<String>)> getUserProgress(
      String userId) async {
    Response response =
        await _ref.read(apiRepoProvider).getUserProgress(userId);
    Map<String, dynamic> map = response.data["data"];

    print(map);
    List<ModuleProgressModel> moduleProgressList = [];

    moduleProgressList = [
      "ipInfo",
      "patentInfo",
      "trademarkInfo",
      "copyrightInfo",
      "designInfo"
    ].map((type) {
      List<LevelProgressModel> levelProgressList = [];
      levelProgressList = (map[type]["levels"] as List<dynamic>)
          .map((e) => LevelProgressModel(
              status: e["status"], pointsEarned: e["pointsEarned"]))
          .toList();
      return ModuleProgressModel(levels: levelProgressList);
    }).toList();
    List<String> badgesList = ["rd", "dg"];
    return (moduleProgressList, badgesList);
  }
}
