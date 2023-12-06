// This class represents all the data
// which defines a Cheese.
import 'package:cheese_chase/config/assets/assets.dart';
import 'package:hive/hive.dart';
part 'cheese_data.g.dart';

class CheeseData {
  final String name;
  final int cost;
  final int spriteId;
  final String assetPath;

  const CheeseData({
    required this.name,
    required this.cost,
    required this.spriteId,
    required this.assetPath,
  });

  /// Given a cheeseType, this method returns a corresponding
  /// Cheese object which holds all the details of that Cheese.
  static CheeseData getCheeseByType(CheeseType cheeseType) {
    /// It is highly unlikely that it [cheeses] does not contain given [cheeseType].
    /// But if that ever happens, we will just return data for [cheeseType.Chedar].
    return cheeses[cheeseType] ?? cheeses.entries.first.value;
  }

  /// This map holds all the meta-data of each [CheeseType].
  static Map<CheeseType, CheeseData> cheeses = {
    CheeseType.freeA: CheeseData(
      name: 'Free A',
      cost: 0,
      spriteId: 0,
      assetPath: PngAssets.cheeseFreeA,
    ),
    CheeseType.freeB: CheeseData(
      name: 'Free B',
      cost: 0,
      spriteId: 1,
      assetPath: PngAssets.cheeseFreeB,
    ),
    CheeseType.chedar: CheeseData(
      name: 'Chedar',
      cost: 200,
      spriteId: 2,
      assetPath: PngAssets.cheeseA,
    ),
    CheeseType.swissCheese: CheeseData(
      name: 'Swiss Cheese',
      cost: 250,
      spriteId: 3,
      assetPath: PngAssets.cheeseB,
    ),
    CheeseType.mozzarella: CheeseData(
      name: 'Mozzarella',
      cost: 300,
      spriteId: 4,
      assetPath: PngAssets.cheeseC,
    ),
    CheeseType.camembert: CheeseData(
      name: 'Camembert',
      cost: 350,
      spriteId: 5,
      assetPath: PngAssets.cheeseD,
    ),
    CheeseType.feta: CheeseData(
      name: 'Feta',
      cost: 400,
      spriteId: 6,
      assetPath: PngAssets.cheeseE,
    ),
    CheeseType.pecorino: CheeseData(
      name: 'Pecorino',
      cost: 450,
      spriteId: 7,
      assetPath: PngAssets.cheeseF,
    ),
    CheeseType.gouda: CheeseData(
      name: 'Gouda',
      cost: 500,
      spriteId: 8,
      assetPath: PngAssets.cheeseG,
    ),
    CheeseType.maasdam: CheeseData(
      name: 'Maasdam',
      cost: 550,
      spriteId: 9,
      assetPath: PngAssets.cheeseH,
    ),
    CheeseType.brie: CheeseData(
      name: 'Brie',
      cost: 600,
      spriteId: 10,
      assetPath: PngAssets.cheeseI,
    ),
    CheeseType.dorblu: CheeseData(
      name: 'Dorblu',
      cost: 650,
      spriteId: 11,
      assetPath: PngAssets.cheeseJ,
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
