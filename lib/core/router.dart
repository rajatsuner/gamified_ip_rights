import 'package:gamified_ip_rights/features/auth/screen/auth_screen.dart';
import 'package:gamified_ip_rights/features/auth/screen/user_info_fill_screen.dart';
import 'package:gamified_ip_rights/features/home/screen/home_screen.dart';
import 'package:gamified_ip_rights/features/module_based/screen/activity_loading_screen.dart';
import 'package:gamified_ip_rights/features/module_based/screen/activity_room_screen.dart';
import 'package:gamified_ip_rights/features/module_based/screen/activity_summary_screen.dart';
import 'package:gamified_ip_rights/features/onboarding/onboarding_screen.dart';

import '../features/splash/splash_screen.dart';

class AppRouter {
  static var routeInfo = {
    AppRoute.splash.path: (context) => const SplashScreen(),
    AppRoute.onboarding.path: (context) => const OnboardingScreen(),
    AppRoute.authentication.path: (context) => const AuthenticationScreen(),
    AppRoute.userinfofillup.path: (context) => const UserInfoFillScreen(),
    AppRoute.home.path: (context) => const HomeScreen(),
    AppRoute.activityLoading.path: (context) => const ActivityLoadingScreen(),
    AppRoute.activityRoom.path: (context) => const ActivityRoomScreen(),
    AppRoute.activitySummary.path: (context) => const ActivitySummaryScreen()
  };
}

enum AppRoute {
  splash("/splash"),
  onboarding("/onboarding"),
  authentication("/authentication"),
  userinfofillup("/user-info-fillup"),
  leaderboard("/leaderboard"),
  home("/home"),
  activityLoading("/map-of-progress/activity-loading"),
  activityRoom("/map-of-progress/activity-room"),
  activitySummary("/map-of-progress/activity-summary");

  final String path;
  const AppRoute(this.path);
}
