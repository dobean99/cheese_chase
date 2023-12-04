import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/widgets/overlays/game_over_menu.dart';
import 'package:cheese_chase/widgets/overlays/home_button.dart';
import 'package:cheese_chase/widgets/overlays/pause_button.dart';
import 'package:cheese_chase/widgets/overlays/pause_menu.dart';

CheeseChase _cheeseChase = CheeseChase();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          backgroundBuilder: (context) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    PngAssets.backgroundImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          game: _cheeseChase,
          initialActiveOverlays: const [PauseButton.id],
          overlayBuilderMap: {
            HomeButton.id: (BuildContext context, CheeseChase game) =>
                HomeButton(
                  game: game,
                ),
            PauseButton.id: (BuildContext context, CheeseChase game) =>
                PauseButton(
                  game: game,
                ),
            PauseMenu.id: (BuildContext context, CheeseChase game) => PauseMenu(
                  game: game,
                ),
            GameOverMenu.id: (BuildContext context, CheeseChase game) =>
                GameOverMenu(
                  game: game,
                ),
          },
        ),
      ),
    );
  }
}
