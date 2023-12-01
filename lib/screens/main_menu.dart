import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/screens/game_play.dart';
import 'package:cheese_chase/screens/statistics_screen.dart';
import 'package:cheese_chase/widgets/commons/base_layout.dart';

// Represents the main menu screen of Spacescape, allowing
// players to start the game or modify in-game settings.
class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(PngAssets.logo),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const SizedBox(
                  height: 10,
                ),
                RoundedGradientStrokeButton(
                  child: const StrokeText(
                    text: "Cheese shop",
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const GamePlay(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedGradientStrokeButton(
                    isCircleButton: true,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const StatisticsScreen(),
                        ),
                      );
                    },
                    child: Image.asset(PngAssets.volumeIcon)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
