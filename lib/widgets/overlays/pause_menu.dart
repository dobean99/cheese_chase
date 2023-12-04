import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/core/constants/app_colors.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/screens/main_menu.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';

class PauseMenu extends StatelessWidget {
  static const String id = 'PauseMenu';
  final CheeseChase game;
  const PauseMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor.withAlpha(100),
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            RoundedGradientStrokeButton(
              isBackgroundMenu: true,
              height: 240,
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RoundedGradientStrokeButton(
                    child: const StrokeText(
                      text: "Return to game",
                    ),
                    onPressed: () {
                      game.resumeEngine();
                      game.overlays.remove(PauseMenu.id);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedGradientStrokeButton(
                    child: const StrokeText(
                      text: "Back in menu",
                    ),
                    onPressed: () {
                      game.overlays.remove(PauseMenu.id);
                      game.reset();
                      game.resumeEngine();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const MainMenu(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(child: Image.asset(PngAssets.pauseText)),
          ],
        ),
      ),
    );
  }
}
