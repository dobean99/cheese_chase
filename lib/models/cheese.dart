// This class represents all the data
// which defines a Cheese.
import 'package:hive/hive.dart';

class Cheese {
  final String name;
  final int cost;
  final int spriteId;
  final String assetPath;

  const Cheese({
    required this.name,
    required this.cost,
    required this.spriteId,
    required this.assetPath,
  });

  /// Given a cheeseType, this method returns a corresponding
  /// Cheese object which holds all the details of that Cheese.
  static Cheese getCheeseByType(CheeseType cheeseType) {
    /// It is highly unlikely that it [cheeses] does not contain given [cheeseType].
    /// But if that ever happens, we will just return data for [cheeseType.Chedar].
    return cheeses[cheeseType] ?? cheeses.entries.first.value;
  }

  /// This map holds all the meta-data of each [CheeseType].
  static const Map<CheeseType, Cheese> cheeses = {
    CheeseType.freeA: Cheese(
      name: 'Free A',
      cost: 0,
      spriteId: 0,
      assetPath: 'assets/images/cheese_free_A.png',
    ),
    CheeseType.freeB: Cheese(
      name: 'Free B',
      cost: 0,
      spriteId: 1,
      assetPath: 'assets/images/cheese_free_B.png',
    ),
    CheeseType.chedar: Cheese(
      name: 'Chedar',
      cost: 200,
      spriteId: 2,
      assetPath: 'assets/images/cheese_A.png',
    ),
    CheeseType.swissCheese: Cheese(
      name: 'Swiss Cheese',
      cost: 250,
      spriteId: 3,
      assetPath: 'assets/images/cheese_B.png',
    ),
    CheeseType.mozzarella: Cheese(
      name: 'Mozzarella',
      cost: 300,
      spriteId: 4,
      assetPath: 'assets/images/cheese_C.png',
    ),
    CheeseType.camembert: Cheese(
      name: 'Camembert',
      cost: 350,
      spriteId: 5,
      assetPath: 'assets/images/cheese_D.png',
    ),
    CheeseType.feta: Cheese(
      name: 'Feta',
      cost: 400,
      spriteId: 6,
      assetPath: 'assets/images/cheese_E.png',
    ),
    CheeseType.pecorino: Cheese(
      name: 'Pecorino',
      cost: 450,
      spriteId: 7,
      assetPath: 'assets/images/cheese_F.png',
    ),
    CheeseType.gouda: Cheese(
      name: 'Gouda',
      cost: 500,
      spriteId: 8,
      assetPath: 'assets/images/cheese_G.png',
    ),
    CheeseType.maasdam: Cheese(
      name: 'Maasdam',
      cost: 550,
      spriteId: 9,
      assetPath: 'assets/images/cheese_H.png',
    ),
    CheeseType.brie: Cheese(
      name: 'Brie',
      cost: 600,
      spriteId: 10,
      assetPath: 'assets/images/cheese_I.png',
    ),
    CheeseType.dorblu: Cheese(
      name: 'Dorblu',
      cost: 650,
      spriteId: 11,
      assetPath: 'assets/images/cheese_J.png',
    ),
  };
}

// This enum represents all the Cheese
// types available in this game.
@HiveType(typeId: 1)
enum CheeseType {
  @HiveField(0)
  freeA,

  @HiveField(1)
  freeB,

  @HiveField(2)
  chedar,

  @HiveField(3)
  swissCheese,

  @HiveField(4)
  mozzarella,

  @HiveField(5)
  camembert,

  @HiveField(6)
  feta,

  @HiveField(7)
  pecorino,

  @HiveField(8)
  gouda,

  @HiveField(9)
  maasdam,

  @HiveField(10)
  brie,

  @HiveField(11)
  dorblu,
}
