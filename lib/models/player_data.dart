import 'package:cheese_chase/models/cheese_data.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
part 'player_data.g.dart';

// This class represents all the persistent data that we
// might want to store for tracking player progress.
@HiveType(typeId: 0)
class PlayerData extends ChangeNotifier with HiveObjectMixin {
  static const String playerDataBox = 'PlayerDataBox';
  static const String playerDataKey = 'PlayerData';

  // The Cheese type of player's current Cheese.
  @HiveField(0)
  CheeseType cheeseType;

  // List of all the Cheeses owned by player.
  // Note that just storing their type is enough.
  @HiveField(1)
  final List<CheeseType> ownedCheeses;

  // Highest player score so far.
  @HiveField(2)
  late int _highScore;
  int get highScore => _highScore;

  // Balance money.
  @HiveField(3)
  int money;

  // Keeps track of current score.
  // If game is not running, this will
  // represent score of last round.
  int _currentScore = 0;

  int get currentScore => _currentScore;

  set currentScore(int newScore) {
    _currentScore = newScore;
    // While setting currentScore to a new value
    // also make sure to update highScore.
    if (_highScore < _currentScore) {
      _highScore = _currentScore;
    }
  }

  PlayerData({
    required this.cheeseType,
    required this.ownedCheeses,
    int highScore = 0,
    required this.money,
  }) {
    _highScore = highScore;
  }

  /// Creates a new instance of [PlayerData] from given map.
  PlayerData.fromMap(Map<String, dynamic> map)
      : cheeseType = map['currentCheeseType'],
        ownedCheeses = map['ownedCheeseTypes']
            .map((e) => e as CheeseType) // Map out each element.
            .cast<CheeseType>() // Cast each element to CheeseType.
            .toList(), // Convert to a List<CheeseType>.
        _highScore = map['highScore'],
        money = map['money'];

  // A default map which should be used for creating the
  // very first PlayerData instance when game is launched
  // for the first time.
  static Map<String, dynamic> defaultData = {
    'currentCheeseType': CheeseType.freeA,
    'ownedCheeseTypes': [CheeseType.freeA, CheeseType.freeB],
    'highScore': 0,
    'money': 0,
  };

  /// Returns true if given [CheeseType] is owned by player.
  bool isOwned(CheeseType cheeseType) {
    return ownedCheeses.contains(cheeseType);
  }

  /// Returns true if player has enough money to by given [CheeseType].
  bool canBuy(CheeseType cheeseType) {
    return (money >= CheeseData.getCheeseByType(cheeseType).cost);
  }

  /// Returns true if player's current Cheese type is same as given [CheeseType].
  bool isEquipped(CheeseType cheeseType) {
    return (this.cheeseType == cheeseType);
  }

  /// Buys the given [CheeseType] if player has enough money and does not already own it.
  void buy(CheeseType cheeseType) {
    if (canBuy(cheeseType) && (!isOwned(cheeseType))) {
      money -= CheeseData.getCheeseByType(cheeseType).cost;
      ownedCheeses.add(cheeseType);
      notifyListeners();

      // Saves player data to disk.
      save();
    }
  }

  /// Sets the given [CheeseType] as the current Cheese type for player.
  void equip(CheeseType cheeseType) {
    this.cheeseType = cheeseType;
    notifyListeners();

    // Saves player data to disk.
    save();
  }
}
