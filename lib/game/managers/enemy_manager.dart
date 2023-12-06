import 'dart:math';

import 'package:cheese_chase/config/assets/assets.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/game/components/enemy.dart';
import 'package:cheese_chase/models/enemy_data.dart';
import 'package:flame/components.dart';

class EnemyManager extends Component with HasGameReference<CheeseChase> {
  late Timer _timer;

  Random random = Random();

  EnemyManager() : super() {
    _timer = Timer(1, onTick: () {}, repeat: true);
    for (int i = 0; i < 10; i++) {
      _spawnEnemy();
    }
  }

  void _spawnEnemy() {
    Vector2 initialSize = Vector2(64, 64);
    Vector2 position =
        Vector2(random.nextDouble() * 500, random.nextDouble() * 500);

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
    // if (game.buildContext != null) {
    //   game.world.add(enemy);
    // }
  }

  @override
  void onMount() {
    super.onMount();
    print(game.size.y);

    _timer.start();
  }

  @override
  void onRemove() {
    super.onRemove();
    _timer.stop();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Update timers with delta time to make them tick.
    _timer.update(dt);
  }

  // Stops and restarts the timer. Should be called
  // while restarting and exiting the game.
  void reset() {
    _timer.stop();
    _timer.start();
  }

  // Pauses spawn timer for 2 seconds when called.
  void freeze() {
    _timer.stop();
  }

  /// A private list of all [EnemyData]s.
  static final List<EnemyData> _enemyDataList = [
    EnemyData(sprite: PngAssets.enemyA),
    EnemyData(sprite: PngAssets.enemyB),
    EnemyData(sprite: PngAssets.enemyC),
  ];
}
