import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/models/player_data.dart';
import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheeseCollected extends StatelessWidget {
  static const String id = 'CheeseCollected';
  final CheeseChase? game;

  const CheeseCollected({super.key, this.game});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 5,
            left: 30,
            child: RoundedGradientStrokeButton(
              height: 40,
              width: 120,
              paddingChild: 0,
              child: Consumer<PlayerData>(
                builder: (context, playerData, child) {
                  String text = game != null
                      ? game!.player.score.toString()
                      : playerData.money.toString();
                  return StrokeText(text: text);
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(PngAssets.cheese),
          )
        ],
      ),
    );
  }
}
