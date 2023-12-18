enum AppLottie {
  idea("idea.json"),
  leaderboardLoading("leaderboard_loading.json"),
  streakIcon("streak_icon.json");

  final String _fileName;
  final _iconPath = 'assets/lotties/';
  String get path => _iconPath + _fileName;
  const AppLottie(String fileName) : _fileName = fileName;
}
