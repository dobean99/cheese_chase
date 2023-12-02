import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/screens/game_play.dart';
import 'package:cheese_chase/widgets/commons/base_layout.dart';

// Represents the main menu screen of Spacescape, allowing
// players to start the game or modify in-game settings.
class WatchOutScreen extends StatelessWidget {
  const WatchOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                PngAssets.logo,
                scale: 1.6,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(PngAssets.watchOut),
                const SizedBox(
                  height: 20,
                ),
                RoundedGradientStrokeButton(
                  child: const StrokeText(
                    text: "Start the chase",
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const GamePlay(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: RoundedGradientStrokeButton(
                  isCircleButton: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(PngAssets.backIcon)),
            ),
          ],
        ),
      ),
    );
  }
}
