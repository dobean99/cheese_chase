import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/config/l10n/l10n.dart';
import 'package:cheese_chase/core/constants/app_colors.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/screens/main_menu.dart';
import 'package:cheese_chase/widgets/commons/circle_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';

class PauseMenu extends StatelessWidget {
  static const String id = 'PauseMenu';
  final CheeseChase game;
  const PauseMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor.withAlpha(100),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StrokeText(text: context.l10n!.pause),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleStrokeButton(
                width: 86,
                child: Image.asset(PngAssets.homeIcon),
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
              const SizedBox(
                width: 100,
              ),
              CircleStrokeButton(
                width: 86,
                child: Image.asset(PngAssets.arrowRightIcon),
                onPressed: () {
                  game.resumeEngine();
                  game.overlays.remove(PauseMenu.id);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
