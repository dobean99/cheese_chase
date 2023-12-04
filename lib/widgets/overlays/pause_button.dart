import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/widgets/overlays/pause_menu.dart';

class PauseButton extends StatelessWidget {
  static const String id = 'PauseButton';
  final CheeseChase game;

  const PauseButton({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
        child: RoundedGradientStrokeButton(
          width: 50,
          height: 50,
          child: Image.asset(PngAssets.pauseIcon),
          onPressed: () {
            game.pauseEngine();
            game.overlays.add(PauseMenu.id);
          },
        ),
      ),
    );
  }
}
