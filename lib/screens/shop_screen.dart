import 'package:cheese_chase/models/cheese_data.dart';
import 'package:cheese_chase/models/player_data.dart';
import 'package:cheese_chase/screens/collect_more_screen.dart';
import 'package:cheese_chase/widgets/commons/cheese_collected.dart';
import 'package:cheese_chase/widgets/commons/rounded_gradient_stroke_button.dart';
import 'package:cheese_chase/widgets/commons/shop_cheese_item.dart';
import 'package:flutter/material.dart';
import 'package:cheese_chase/config/assets/png_assets.dart';
import 'package:cheese_chase/widgets/commons/base_layout.dart';
import 'package:provider/provider.dart';

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
                    mainAxisExtent: 140,
                  ),
                  itemBuilder: (_, index) {
                    final cheeseData =
                        CheeseData.cheeses.entries.elementAt(index + 2).value;
                    return Consumer<PlayerData>(
                        builder: (context, playerData, child) {
                      final type =
                          CheeseData.cheeses.entries.elementAt(index + 2).key;
                      // final isEquipped = playerData.isEquipped(type);
                      // final isOwned = playerData.isOwned(type);
                      final canBuy = playerData.canBuy(type);
                      return ShopCheesItem(
                        itemName: cheeseData.name,
                        assetImage: cheeseData.assetPath,
                        amount: cheeseData.cost,
                        onPress: () {
                          if (canBuy) {
                            playerData.buy(type);
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CollectMoreScreen(),
                              ),
                            );
                          }
                        },
                      );
                    });
                  },
                  itemCount: CheeseData.cheeses.length - 2,
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
