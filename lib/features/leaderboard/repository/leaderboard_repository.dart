import 'dart:math';
import 'package:dio/dio.dart';
import 'package:gamified_ip_rights/common/repository/api_repo.dart';
import 'package:gamified_ip_rights/features/leaderboard/model/leader_player_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/core/value/strings.dart';

final leaderboardRepositoryProvider =
    Provider((ref) => LeaderboardRepository(ref: ref));

class LeaderboardRepository {
  Ref _ref;
  String _endPoint = 'rank/getRanks';
  LeaderboardRepository({required Ref ref}) : _ref = ref;

  Future<(List<LeaderPlayerModel>, LeaderPlayerModel?)> getRanks(
      String userId, String rankBasis) async {
    try {
      List<LeaderPlayerModel> rankList = [];

      Response response =
          await _ref.read(apiRepoProvider).getRanks(userId, rankBasis);
      print(response.data);
      Map<String, dynamic> data = response.data;
      List<dynamic> top50UserInfo = data["top50UserInfo"] as List<dynamic>;
      LeaderPlayerModel? currentUserInfo;
      Map<String, dynamic> userRankAndInfoMap =
          data["userRankandInfo"] as Map<String, dynamic>;
      debugPrint("C1");
      if (userRankAndInfoMap["rank"] != 0) {
        Map<String, dynamic> currentUserInfoMap =
            userRankAndInfoMap["currentUserinfo"] as Map<String, dynamic>;
        debugPrint("C2");
        currentUserInfo = LeaderPlayerModel(
            userId: userId,
            userName: (currentUserInfoMap["userId"])[0],
            rank: userRankAndInfoMap["rank"],
            points: currentUserInfoMap["totalPoints"] as int);
      }

      for (var i = 0; i < top50UserInfo.length; i++) {
        Map<String, dynamic> user = top50UserInfo[i];
        rankList.add(LeaderPlayerModel(
            userId: (user["userId"] as List<dynamic>)[0] as String,
            userName: (user["userName"] as List<dynamic>)[0] as String,
            rank: i + 1,
            points: user["totalPoints"] as int));
      }

      return (rankList, currentUserInfo);
    } catch (e) {
      debugPrint(e.toString());
      return (<LeaderPlayerModel>[], null);
    }
  }
}
