import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';
import 'package:flutter/material.dart';

class CheeseCollected extends StatelessWidget {
  const CheeseCollected({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: 5,
            left: 30,
            child: RoundedGradientStrokeButton(
                height: 40,
                width: 120,
                paddingChild: 0,
                child: StrokeText(text: "150")),
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
