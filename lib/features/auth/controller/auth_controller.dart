import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/core/router.dart';
import 'package:gamified_ip_rights/features/auth/controller/_providers.dart';
import 'package:gamified_ip_rights/features/auth/model/user_model.dart';
import 'package:gamified_ip_rights/features/auth/repository/auth_repository.dart';
import 'package:gamified_ip_rights/features/leaderboard/controller/leaderboard_controller.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(false,
        ref: ref, authRepository: ref.read(authRepositoryProvider)));

class AuthController extends StateNotifier<bool> {
  ///-------------------------
  Ref _ref;
  AuthRepository _authRepository;
  AuthController(super.state,
      {required Ref ref, required AuthRepository authRepository})
      : _authRepository = authRepository,
        _ref = ref;

  ///----------------

  void signInWithGoogle(BuildContext context) async {
    state = true;
    try {
      final (user, isNewUser) = await _authRepository.signInWithGoogle();
      _ref.read(userModelProvider.notifier).update((state) => user);
      if (user != null) {
        if (isNewUser) {
          debugPrint("CONTROLLER : signedIn successfull but new User");
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.userinfofillup.path, (route) => false);
        } else {
          debugPrint(
              "CONTROLLER : signedIn successfull, old user , info available");
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.home.path, (route) => false);
        }
      }
    } catch (e) {}
    state = false;
  }

  void logOut() {
    _authRepository.logOut();
  }

  Future<void> checkUserAlreadyLoggedIn(BuildContext context) async {
    if (FirebaseAuth.instance.currentUser == null) {
      debugPrint("INITIAL : user not logged in ");
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.onboarding.path, (route) => false);
      });
    } else {
      debugPrint("INITIAL : user already logged in ");

      final (userModel, check) = await _authRepository
          .getUserData(FirebaseAuth.instance.currentUser!.uid);
      print(userModel);
      _ref.read(userModelProvider.notifier).update((state) => userModel);

      if (userModel != null) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.home.path, (route) => false);
        });
      } else {
        _ref.read(userModelProvider.notifier).update((state) => UserModel(
            userId: FirebaseAuth.instance.currentUser!.uid,
            email: FirebaseAuth.instance.currentUser!.email,
            userName: FirebaseAuth.instance.currentUser!.displayName));
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.userinfofillup.path, (route) => false);
      }
    }
  }

  Future<void> registerUser(BuildContext context) async {
    state = true;
    UserModel userModel = _ref.read(userModelProvider)!;
    if (await _authRepository.registerUser(userModel)) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoute.home.path, (route) => false);
      });
    }
    state = false;
  }
}
