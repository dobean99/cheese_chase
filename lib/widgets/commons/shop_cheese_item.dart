import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/core/constants/app_colors.dart';
import 'package:cheese_chase/core/constants/app_constants.dart';
import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/stroke_text.dart';
import 'package:flutter/material.dart';

class ShopCheesItem extends StatelessWidget {
  final String itemName;
  final String assetImage;
  final int amount;
  final void Function()? onPress;
  const ShopCheesItem(
      {super.key,
      required this.itemName,
      required this.assetImage,
      required this.amount,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    PngAssets.cheeseBackground,
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              border: Border.all(
                color: AppColors.whiteColor,
                width: AppConstants.borderWidth,
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 60,
                    height: 50,
                    child: Image.asset(
                      "assets/images/$assetImage",
                    ),
                  ),
                  StrokeText(
                    text: itemName,
                    textSize: 12,
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        RoundedGradientStrokeButton(
          paddingChild: 5,
          width: 100,
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                PngAssets.cheese,
                scale: 1.5,
              ),
              const SizedBox(
                width: 10,
              ),
              StrokeText(
                text: amount.toString(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
