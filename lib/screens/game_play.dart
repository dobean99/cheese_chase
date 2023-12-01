import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/game/cheese_chase.dart';
import 'package:cheese_chase/widgets/overlays/game_over_menu.dart';
import 'package:cheese_chase/widgets/overlays/home_button.dart';
import 'package:cheese_chase/widgets/overlays/pause_button.dart';
import 'package:cheese_chase/widgets/overlays/pause_menu.dart';

CheeseChase _theDartboard = CheeseChase();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        // GameWidget is useful to inject the underlying
        // widget of any class extending from Flame's Game class.
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
              // child: Center(
              //   child: Text(
              //     context.l10n!.appName.toUpperCase(),
              //     style: const TextStyle(
              //         color: Color(
              //           0xFFFFA91F,
              //         ),
              //         fontSize: 50),
              //   ),
              // ),
            );
          },
          game: _theDartboard,
          // Initially only pause button overlay will be visible.
          initialActiveOverlays: const [HomeButton.id, PauseButton.id],
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
