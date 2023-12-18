import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/core/value/enums.dart';
import 'package:gamified_ip_rights/features/leaderboard/model/leader_player_model.dart';

final leaderboardFilterProvider =
    StateProvider((ref) => LeaderFilterType.daily);

final leaderboardListProvider =
    StateProvider<List<LeaderPlayerModel>>((ref) => []);

final myRankProvider = StateProvider<LeaderPlayerModel?>((ref) => null);
