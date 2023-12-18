import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/core/value/enums.dart';
import 'package:gamified_ip_rights/features/auth/controller/_providers.dart';
import 'package:gamified_ip_rights/features/auth/model/user_model.dart';
import 'package:gamified_ip_rights/features/leaderboard/controller/leaderboard_providers.dart';
import 'package:gamified_ip_rights/features/leaderboard/model/leader_player_model.dart';
import 'package:gamified_ip_rights/features/leaderboard/repository/leaderboard_repository.dart';

final leaderboardControllerProvider =
    StateNotifierProvider<LeaderboardController, bool>((ref) =>
        LeaderboardController(false,
            ref: ref,
            leaderboardRepository: ref.read(leaderboardRepositoryProvider)));

class LeaderboardController extends StateNotifier<bool> {
  Ref _ref;
  LeaderboardRepository _leaderboardRepository;
  LeaderboardController(super.state,
      {required Ref ref, required LeaderboardRepository leaderboardRepository})
      : _ref = ref,
        _leaderboardRepository = leaderboardRepository;

  changeFilterType(LeaderFilterType filterType) async {
    LeaderFilterType currentFilterType = _ref.read(leaderboardFilterProvider);
    print(currentFilterType);
    print(filterType);
    if (filterType != currentFilterType) {
      _ref
          .read(leaderboardFilterProvider.notifier)
          .update((state) => filterType);
      _ref.read(leaderboardListProvider.notifier).update((state) => []);
      getLeaderboardData();
    }
  }

  getLeaderboardData() async {
    List<LeaderPlayerModel> list;
    LeaderPlayerModel? currentPlayerLeaderModel;
    String rankBasis = _ref.read(leaderboardFilterProvider).type;
    String userId = _ref.read(userModelProvider)!.userId;
    (list, currentPlayerLeaderModel) =
        await _leaderboardRepository.getRanks(userId, rankBasis);
    _ref.read(leaderboardListProvider.notifier).update((state) => list);
    list.any((player) => player.userId == userId);
    if (list.any((player) => player.userId == userId)) {
      _ref.read(myRankProvider.notifier).update((state) => null);
    } else {
      _ref
          .read(myRankProvider.notifier)
          .update((state) => currentPlayerLeaderModel);
    }
  }
}
