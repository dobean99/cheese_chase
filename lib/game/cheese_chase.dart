import 'package:cheese_chase/core/constants/app_colors.dart';
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
  late Player player;
  late EnemyManager _enemyManager;
  late CheeseManager _cheeseManager;
  late TextComponent textStrokeWhite;
  late TextComponent textYellow;
  late SpriteComponent scoreBackground;
  // @override
  // bool debugMode = true;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    const priorityLevel = 5;
    Sprite scoreBG = await Sprite.load(PngAssets.scoreBackground);
    scoreBackground = SpriteComponent(
      sprite: scoreBG,
      position: Vector2(size.x - 150, 20),
      priority: priorityLevel,
    );
    TextPaint strokeTextPaint = TextPaint(
        style: TextStyle(
      fontSize: 20,
      fontFamily: "Brocil",
      fontWeight: FontWeight.w700,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..color = AppColors.whiteColor,
    ));
    TextPaint textPaint = TextPaint(
        style: const TextStyle(
      fontFamily: "Brocil",
      fontSize: 20,
      color: AppColors.textTitleColor,
      fontWeight: FontWeight.w700,
    ));
    textStrokeWhite = TextComponent(
      text: 'Stroke Text',
      textRenderer: strokeTextPaint,
      position: scoreBackground.center,
      anchor: Anchor.centerLeft,
      priority: priorityLevel,
    );
    textYellow = TextComponent(
      text: 'Stroke Text',
      textRenderer: textPaint,
      position: scoreBackground.center,
      anchor: Anchor.centerLeft,
      priority: priorityLevel,
    );
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
      priority: priorityLevel,
    );
    player = Player(
      joystick: joystick,
      size: Vector2(64, 64),
      position: size / 2,
    );
    _enemyManager = EnemyManager();
    _cheeseManager = CheeseManager();

    addAll([
      _audioPlayerComponent,
      player,
      _enemyManager,
      _cheeseManager,
      joystick,
      scoreBackground,
      textStrokeWhite,
      textYellow,
    ]);
  }

  @override
  void onAttach() {
    _audioPlayerComponent.playBgm(AudioAssets.bgAudio);
    super.onAttach();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (player.isMounted) {
      textStrokeWhite.text = textYellow.text = "${player.score}";
    }
  }

  gameOver() {
    pauseEngine();
    overlays.add(GameOverMenu.id);
    reset();
  }

  void reset() {
    player.reset();
    _enemyManager.reset();
    _cheeseManager.reset();
  }

  @override
  void onDetach() {
    _audioPlayerComponent.stopBgm();
    super.onDetach();
  }
}
