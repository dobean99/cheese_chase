import 'package:cheese_chase/widgets/commons/cheese_collected.dart';
import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/core/constants/app_colors.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/screens/main_menu.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';

class GameOverMenu extends StatelessWidget {
  static const String id = 'GameOverMenu';
  final CheeseChase game;
  const GameOverMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor.withAlpha(100),
      body: Center(
        child: SizedBox(
          height: 240,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              RoundedGradientStrokeButton(
                isBackgroundMenu: true,
                height: 220,
                width: 230,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RoundedGradientStrokeButton(
                      child: const StrokeText(
                        text: "Try again",
                      ),
                      onPressed: () {
                        game.overlays.remove(GameOverMenu.id);
                        game.reset();
                        game.resumeEngine();
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
                        game.overlays.remove(GameOverMenu.id);
                        game.reset();
                        game.resumeEngine();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const MainMenu(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Positioned(child: Image.asset(PngAssets.youLoseText)),
              const Positioned(bottom: 0, child: CheeseCollected()),
            ],
          ),
        ),
      ),
    );
  }
}
