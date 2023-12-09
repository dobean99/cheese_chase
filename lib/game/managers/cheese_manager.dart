import 'dart:math';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/game/components/cheese.dart';
import 'package:cheese_chase/models/cheese_data.dart';
import 'package:cheese_chase/models/player_data.dart';
import 'package:flame/components.dart';
import 'package:provider/provider.dart';

class CheeseManager extends Component with HasGameReference<CheeseChase> {
  late Timer _timer;

  Random random = Random();

  CheeseManager() : super() {
    _timer = Timer(5, onTick: _spawnCheese, repeat: true);
    // for (int i = 0; i < 10; i++) {
    //   _spawnEnemy();
    // }
  }

  void _spawnCheese() {
    Vector2 initialSize = Vector2(64, 64);
    Vector2 position = Vector2(
        random.nextDouble() * game.size.x, random.nextDouble() * game.size.y);

    position.clamp(
      Vector2.zero() + initialSize / 2,
      game.size - initialSize / 2,
    );
    if (game.buildContext != null) {
      final List<CheeseType> list =
          Provider.of<PlayerData>(game.buildContext!, listen: false)
              .ownedCheeses;
      final cheeseType = list.elementAt(random.nextInt(list.length));
      final cheeseData = CheeseData.getCheeseByType(cheeseType);
      Cheese cheese = Cheese(
        spritePath: cheeseData.assetPath,
        position: position,
      );
      cheese.anchor = Anchor.center;

      game.add(cheese);
    }
  }

  @override
  void onMount() {
    super.onMount();
    _timer.start();
    for (int i = 0; i < 10; i++) {
      _spawnCheese();
    }
  }

  @override
  void onRemove() {
    super.onRemove();
    _timer.stop();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timer.update(dt);
  }

  void reset() {
    _timer.stop();
    for (int i = 0; i < 5; i++) {
      _spawnCheese();
    }
    _timer.start();
  }

  void freeze() {
    _timer.stop();
  }
}
