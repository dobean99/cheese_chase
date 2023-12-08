import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';

class CollectMoreScreen extends StatelessWidget {
  const CollectMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            PngAssets.notEnoughBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SizedBox(
          height: 170,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              RoundedGradientStrokeButton(
                isBackgroundMenu: true,
                height: 150,
                width: 230,
                child: Container(),
              ),
              Positioned(child: Image.asset(PngAssets.collectMore)),
              Positioned(
                bottom: 0,
                child: RoundedGradientStrokeButton(
                  width: 100,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const StrokeText(
                    text: 'Ok',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
