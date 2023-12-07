import 'package:cheese_chase/widgets/commons/cheese_collected.dart';
import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/shop_cheese_item.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/widgets/commons/base_layout.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  PngAssets.cheeseShop,
                ),
              ),
              const CheeseCollected(),
              Flexible(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 40.0,
                    mainAxisExtent: 150,
                  ),
                  itemBuilder: (_, index) => ShopCheesItem(
                    itemName: 'Chedar',
                    assetImage: PngAssets.cheeseBackground,
                    amount: 200,
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: RoundedGradientStrokeButton(
                  width: 50,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(PngAssets.backIcon)),
            ),
          )
        ],
      ),
    );
  }
}
