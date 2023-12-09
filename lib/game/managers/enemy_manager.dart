import 'dart:math';

import 'package:cheese_chase/config/assets/assets.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/game/components/enemy.dart';
import 'package:cheese_chase/models/enemy_data.dart';
import 'package:flame/components.dart';

class EnemyManager extends Component with HasGameReference<CheeseChase> {
  Random random = Random();

  EnemyManager() : super();

  void _spawnEnemy() {
    Vector2 initialSize = Vector2(64, 64);
    Vector2 position = Vector2(
        random.nextDouble() * game.size.x, random.nextDouble() * game.size.y);

    position.clamp(
      Vector2.zero() + initialSize / 2,
      Vector2(500, 500) - initialSize / 2,
    );

    final enemyData = _enemyDataList.elementAt(random.nextInt(2));

    Enemy enemy = Enemy(
      spritePath: enemyData.sprite,
      size: initialSize,
      position: position,
      enemyData: enemyData,
    );

    enemy.anchor = Anchor.center;
    game.add(enemy);
  }

  @override
  void onMount() {
    super.onMount();
    for (int i = 0; i < 5; i++) {
      _spawnEnemy();
    }
  }

  void reset() {
    for (int i = 0; i < 5; i++) {
      _spawnEnemy();
    }
  }

  /// A private list of all [EnemyData]s.
  static final List<EnemyData> _enemyDataList = [
    EnemyData(sprite: PngAssets.enemyA),
    EnemyData(sprite: PngAssets.enemyB),
    EnemyData(sprite: PngAssets.enemyC),
  ];
}
