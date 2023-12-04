class PngAssets {
  //get full path file name .png ==> example "assets/images/blue_ballon.png"
  static String get logo => 'logo_text'.png;
  static String get cheeseShop => 'cheese_shop'.png;
  static String get youLoseText => 'you_lose_text'.png;

  static String get backgroundImage => 'background_image'.png;
  static String get buttonBackground => 'button_background'.png;
  static String get backgroundGameplay => 'background_gameplay'.png;
  static String get backgroundMenu => 'background_menu'.png;

  static String get cheeseBackground => 'cheese_background'.png;
  static String get playIcon => 'play_icon'.png;
  static String get settingsIcon => 'settings_icon'.png;
  static String get volumeIcon => 'volume_icon'.png;
  static String get volumeOffIcon => 'volume_off_icon'.png;

  static String get backIcon => 'back_icon'.png;
  static String get watchOut => 'watch_out'.png;
  static String get pauseText => 'pause_text'.png;

  static String get pauseIcon => 'pause_icon'.png;
  static String get cheeseA => 'cheese_A'.png;
  static String get cheese => 'cheese'.png;

//get only file name .png ==> example "blue_ballon.png"
  static String get player => 'player'.src;
  static String get plusCheese => 'plus_cheese'.src;
  const PngAssets._();
}

extension on String {
  String get png => 'assets/images/$this.png';
  String get src => '$this.png';
}
