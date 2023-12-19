import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/features/auth/controller/_providers.dart';
import 'package:gamified_ip_rights/features/module_based/controller/module_controller.dart';
import 'package:gamified_ip_rights/features/user_progress/controller/_providers.dart';
import 'package:gamified_ip_rights/features/user_progress/repository/user_progress_repository.dart';

final userProgressController =
    StateNotifierProvider<UserProgressController, bool>((ref) =>
        UserProgressController(false,
            ref: ref,
            userProgressRepository: ref.read(userProgressRepoProvider)));

class UserProgressController extends StateNotifier<bool> {
  Ref _ref;
  UserProgressRepository _userProgressRepository;

  UserProgressController(super.state,
      {required Ref ref,
      required UserProgressRepository userProgressRepository})
      : _userProgressRepository = userProgressRepository,
        _ref = ref;

  getUserProgress() async {
    String userId = _ref.read(userModelProvider)!.userId;
    final (moduleProgressList, badgesList) =
        await _userProgressRepository.getUserProgress(userId);
    if (moduleProgressList != null && moduleProgressList.isNotEmpty) {
      _ref
          .read(moduleProgressProvider.notifier)
          .update((state) => moduleProgressList);
      _ref.read(moduleControllerProvider.notifier).getModules();
    }

    if (badgesList != null && badgesList.isNotEmpty) {
      _ref.read(userBadgesProvider.notifier).update((state) => badgesList);
    }

    print(moduleProgressList);
    print(badgesList);
  }
}
