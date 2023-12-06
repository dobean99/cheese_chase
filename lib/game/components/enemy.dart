import 'dart:async';
import 'dart:math';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/game/components/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import '../../models/enemy_data.dart';

class Enemy extends SpriteComponent
    with CollisionCallbacks, HasGameReference<CheeseChase> {
  final _random = Random();

  final EnemyData enemyData;
  final String spritePath;
  Vector2 getRandomVector() {
    return (Vector2.random(_random) - Vector2.random(_random)) * 500;
  }

  Vector2 getRandomDirection() {
    return (Vector2.random(_random) - Vector2(0.5, -1)).normalized();
  }

  Enemy(
     {required this.spritePath,
    required this.enemyData,
    required Vector2? position,
    required Vector2? size,
  }) : super(position: position, size: size) {
    angle = pi;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load(spritePath);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Player) {
      destroy();
    }
  }

  // This method will destory this enemy.
  void destroy() {
    removeFromParent();
  }
}
