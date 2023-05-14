abstract class Assets {
  const Assets._();

  // ignore: library_private_types_in_public_api
  static _Icons get icons => const _Icons();

  // ignore: library_private_types_in_public_api
  static _Images get images => const _Images();
  // ignore: library_private_types_in_public_api
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get appLogo => '$basePath/logo.svg';
  String get searchIcon => '$basePath/search_icon.svg';
  String get pauseIcon => '$basePath/download_pause_icon.svg';
  String get downloadIcon => '$basePath/download_icon.svg';
  String get checkIcon => '$basePath/check_icon.svg';
  String get homeIcon => '$basePath/home_icon.svg';
  String get downloadingMenuIcon => '$basePath/downloading_menu_icon.svg';
  String get downloadedMenuIcon => '$basePath/downloaded_menu_icon.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');
  String get bitmapImage => '$basePath/bitmap_image_one.png';
}
