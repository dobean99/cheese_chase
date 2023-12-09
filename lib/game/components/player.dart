import 'dart:math';

import 'package:cheese_chase/config/config.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/game/components/audio_player_component.dart';
import 'package:cheese_chase/game/components/cheese.dart';
import 'package:cheese_chase/game/components/enemy.dart';
import 'package:cheese_chase/models/player_data.dart';
import 'package:cheese_chase/models/settings.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// This component class represents the player character in game.
class Player extends SpriteComponent
    with CollisionCallbacks, HasGameReference<CheeseChase>, KeyboardHandler {
  JoystickComponent joystick;
  late PlayerData _playerData;
  int get score => _playerData.money;
  final _random = Random();
  late AudioPlayerComponent audioplayer;

  Vector2 getRandomVector() {
    return (Vector2.random(_random) - Vector2(0.5, -1)) * 200;
  }

  Player({
    required this.joystick,
    required this.audioplayer,
    Vector2? position,
    Vector2? size,
  }) : super(position: position, size: size);
  @override
  void onLoad() async {
    sprite = await Sprite.load(PngAssets.player);
    return super.onLoad();
  }

  @override
  void onMount() {
    super.onMount();
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);

    _playerData = Provider.of<PlayerData>(game.buildContext!, listen: false);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Enemy) {
      game.gameOver();
    }
    if (other is Cheese) {
      if (game.buildContext != null) {
        if (Provider.of<Settings>(game.buildContext!, listen: false).bgm) {
          audioplayer.playBgm();
        }
      }
      addToScore();
    }
  }

  void addToScore() {
    int points = 1;
    _playerData.currentScore += points;
    _playerData.money += points;

    // Saves player data to disk.
    _playerData.save();
  }

  Vector2 keyboardDelta = Vector2.zero();
  static final _keysWatched = {
    LogicalKeyboardKey.keyW,
    LogicalKeyboardKey.keyA,
    LogicalKeyboardKey.keyS,
    LogicalKeyboardKey.keyD,
    LogicalKeyboardKey.space,
  };

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // Set this to zero first - if the user releases all keys pressed, then
    // the set will be empty and our vector non-zero.
    keyboardDelta.setZero();

    if (!_keysWatched.contains(event.logicalKey)) return true;

    if (event is RawKeyDownEvent &&
        !event.repeat &&
        event.logicalKey == LogicalKeyboardKey.space) {
      // pew pew!
      joystickAction();
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyW)) {
      keyboardDelta.y = -1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      keyboardDelta.x = -1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
      keyboardDelta.y = 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      keyboardDelta.x = 1;
    }

    // Handled keyboard input
    return false;
  }

  // This method is called by game class for every frame.
  @override
  void update(double dt) {
    super.update(dt);
    if (joystick.direction != JoystickDirection.idle) {
      position.add(joystick.delta * dt);
      angle = joystick.delta.screenAngle();
    }
    // Clamp position of player such that the player sprite does not go outside the screen size.
    position.clamp(
      Vector2.zero() + size / 2,
      game.size - size / 2,
    );

    // Adds thruster particles.
  }

  void joystickAction() {}

  void reset() {
    position = game.size / 2;
  }
}
