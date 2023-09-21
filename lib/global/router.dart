import 'package:flutter/material.dart';
import 'package:gamified_ip_rights/ui/activity_room/activity_room_screen.dart';
import 'package:gamified_ip_rights/ui/authentication/authentication_screen.dart';
import 'package:gamified_ip_rights/ui/home/home_screen.dart';
import 'package:gamified_ip_rights/ui/onboarding/onboarding_screen.dart';
import 'package:gamified_ip_rights/ui/splash/splash_screen.dart';

class AppRouter {
  static var routeInfo = {
    AppRoute.home.path: (context) => const HomeScreen(),
    AppRoute.splash.path: (context) => const SplashScreen(),
    AppRoute.onboarding.path: (context) => const OnboardingScreen(),
    AppRoute.authentication.path: (context) => const AuthenticationScreen(),
    AppRoute.activityRoom.path: (context) => const ActivityRoomScreen()
  };
}

enum AppRoute {
  home("/home"),
  splash("/splash"),
  onboarding("/onboarding"),
  authentication("/authentication"),
  activityRoom("/activity_room");

  final String path;
  const AppRoute(this.path);
}
