import 'dart:async';
import 'package:cheese_chase/game/components/audio_player_component.dart';
import 'package:cheese_chase/game/components/player.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:cheese_chase/config/config.dart';
import 'package:cheese_chase/widgets/overlays/game_over_menu.dart';
import 'package:flutter/material.dart';

class CheeseChase extends FlameGame {
  late AudioPlayerComponent _audioPlayerComponent;
  late Player _player;
  final joystick = JoystickComponent(
    anchor: Anchor.bottomLeft,
    position: Vector2(30, 30),
    // size: 100,
    background: CircleComponent(
      radius: 60,
      paint: Paint()..color = Colors.white.withOpacity(0.5),
    ),
    knob: CircleComponent(radius: 30),
  );
  @override
  bool debugMode = false;

  @override
  Future<void> onLoad() async {
    _audioPlayerComponent = AudioPlayerComponent();
    _player = Player(
      joystick: joystick,
      size: Vector2(64, 64),
      position: size,
    );
    addAll([_audioPlayerComponent, _player]);
    return super.onLoad();
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

  void reset() {}

  @override
  void onDetach() {
    _audioPlayerComponent.stopBgm();
    super.onDetach();
  }
}
