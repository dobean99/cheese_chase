import 'dart:async';
import 'dart:math';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/game/components/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Cheese extends SpriteComponent
    with CollisionCallbacks, HasGameReference<CheeseChase> {
  final _random = Random();
  final String spritePath;
  Vector2 getRandomVector() {
    return (Vector2.random(_random) - Vector2.random(_random)) * 500;
  }

  Vector2 getRandomDirection() {
    return (Vector2.random(_random) - Vector2(0.5, -1)).normalized();
  }

  Cheese({
    required this.spritePath,
    required Vector2? position,
  }) : super(position: position) {
    angle = pi * _random.nextDouble();
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load(spritePath);
  }

  @override
  void onMount() {
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);
    super.onMount();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Player) {
      destroy();
    }
  }

  // This method will destory this Cheese.
  void destroy() {
    removeFromParent();
  }
}
