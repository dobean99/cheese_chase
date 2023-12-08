class PngAssets {
  //get full path file name .png ==> example "assets/images/blue_ballon.png"
  static String get logo => 'logo_text'.png;
  static String get cheeseShop => 'cheese_shop'.png;
  static String get youLoseText => 'you_lose_text'.png;
  static String get collectMore => 'collect_more'.png;

  static String get backgroundImage => 'background_image'.png;
  static String get buttonBackground => 'button_background'.png;
  static String get backgroundGameplay => 'background_gameplay'.png;
  static String get backgroundMenu => 'background_menu'.png;
  static String get notEnoughBackground => 'not_enough_background'.png;

  static String get cheeseBackground => 'cheese_background'.png;
  static String get playIcon => 'play_icon'.png;
  static String get settingsIcon => 'settings_icon'.png;
  static String get volumeIcon => 'volume_icon'.png;
  static String get volumeOffIcon => 'volume_off_icon'.png;

  static String get backIcon => 'back_icon'.png;
  static String get watchOut => 'watch_out'.png;
  static String get pauseText => 'pause_text'.png;

  static String get pauseIcon => 'pause_icon'.png;
  static String get cheeseAIcon => 'cheese_A'.png;
  static String get cheese => 'cheese'.png;

//get only file name .png ==> example "blue_ballon.png"
  static String get player => 'player'.src;
  static String get plusCheese => 'plus_cheese'.src;
  static String get scoreBackground => 'score_background'.src;
  static String get cheeseFreeA => 'cheese_free_A'.src;
  static String get cheeseFreeB => 'cheese_free_B'.src;
  static String get cheeseA => 'cheese_A'.src;
  static String get cheeseB => 'cheese_B'.src;
  static String get cheeseC => 'cheese_C'.src;
  static String get cheeseD => 'cheese_D'.src;
  static String get cheeseE => 'cheese_E'.src;
  static String get cheeseF => 'cheese_F'.src;
  static String get cheeseG => 'cheese_G'.src;
  static String get cheeseH => 'cheese_H'.src;
  static String get cheeseI => 'cheese_I'.src;
  static String get cheeseJ => 'cheese_J'.src;
  static String get enemyA => 'enemy_A'.src;
  static String get enemyB => 'enemy_B'.src;
  static String get enemyC => 'enemy_C'.src;
  const PngAssets._();
}

extension on String {
  String get png => 'assets/images/$this.png';
  String get src => '$this.png';
}
