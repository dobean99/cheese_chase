import 'package:cheese_chase/screens/shop_screen.dart';
import 'package:cheese_chase/screens/watch_out_screen.dart';
import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/screens/statistics_screen.dart';
import 'package:cheese_chase/widgets/commons/base_layout.dart';

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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WatchOutScreen(),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ShopScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedGradientStrokeButton(
                    width: 50,
                    // isCircleButton: true,
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
