enum AppIcons {
  logo("logo.png"),
  flash("flash.png"),
  redHeart("red_heart.png"),
  blackHeart("black_heart.png"),
  google("google.png");

  final String _fileName;
  final _iconPath = 'assets/icons/';
  String get path => _iconPath + _fileName;
  const AppIcons(String fileName) : _fileName = fileName;
}
