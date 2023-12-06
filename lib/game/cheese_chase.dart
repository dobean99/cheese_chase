import 'dart:async';
import 'package:cheese_chase/game/components/audio_player_component.dart';
import 'package:cheese_chase/game/components/player.dart';
import 'package:cheese_chase/game/managers/cheese_manager.dart';
import 'package:cheese_chase/game/managers/enemy_manager.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:cheese_chase/config/config.dart';
import 'package:cheese_chase/widgets/overlays/game_over_menu.dart';
import 'package:flutter/material.dart';

class CheeseChase extends FlameGame with HasCollisionDetection {
  late AudioPlayerComponent _audioPlayerComponent;
  late Player _player;
  late EnemyManager _enemyManager;
  late CheeseManager _cheeseManager;
  @override
  bool debugMode = true;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _audioPlayerComponent = AudioPlayerComponent();
    final joystick = JoystickComponent(
      anchor: Anchor.bottomLeft,
      position: Vector2(30, size.y - 30),
      // size: 100,
      background: CircleComponent(
        radius: 60,
        paint: Paint()..color = Colors.white.withOpacity(0.5),
      ),
      knob: CircleComponent(radius: 30),
    );
    _player = Player(
      joystick: joystick,
      size: Vector2(64, 64),
      position: size / 2,
    );
    _enemyManager = EnemyManager();
    _cheeseManager = CheeseManager();
    addAll([
      _audioPlayerComponent,
      _player,
      joystick,
      _enemyManager,
      _cheeseManager
    ]);
  }

  @override
  void onAttach() {
    _audioPlayerComponent.playBgm(AudioAssets.bgAudio);
    super.onAttach();
  }

  @override
  void update(double dt) {
    // gameOver();
    super.update(dt);
  }

  gameOver() {
    pauseEngine();
    overlays.add(GameOverMenu.id);
  }

  void reset() {
    _player.reset();
    _enemyManager.reset();
  }

  @override
  void onDetach() {
    _audioPlayerComponent.stopBgm();
    super.onDetach();
  }
}
