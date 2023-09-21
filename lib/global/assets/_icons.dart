enum AppIcons {
  logo("logo.png"),
  img("fgfg.jof");

  final String _fileName;
  final _iconPath = 'assets/icons/';
  String get path => _iconPath + _fileName;
  const AppIcons(String fileName) : _fileName = fileName;
}
