// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheese_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheeseTypeAdapter extends TypeAdapter<CheeseType> {
  @override
  final int typeId = 1;

  @override
  CheeseType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CheeseType.freeA;
      case 1:
        return CheeseType.freeB;
      case 2:
        return CheeseType.chedar;
      case 3:
        return CheeseType.swissCheese;
      case 4:
        return CheeseType.mozzarella;
      case 5:
        return CheeseType.camembert;
      case 6:
        return CheeseType.feta;
      case 7:
        return CheeseType.pecorino;
      case 8:
        return CheeseType.gouda;
      case 9:
        return CheeseType.maasdam;
      case 10:
        return CheeseType.brie;
      case 11:
        return CheeseType.dorblu;
      default:
        return CheeseType.freeA;
    }
  }

  @override
  void write(BinaryWriter writer, CheeseType obj) {
    switch (obj) {
      case CheeseType.freeA:
        writer.writeByte(0);
        break;
      case CheeseType.freeB:
        writer.writeByte(1);
        break;
      case CheeseType.chedar:
        writer.writeByte(2);
        break;
      case CheeseType.swissCheese:
        writer.writeByte(3);
        break;
      case CheeseType.mozzarella:
        writer.writeByte(4);
        break;
      case CheeseType.camembert:
        writer.writeByte(5);
        break;
      case CheeseType.feta:
        writer.writeByte(6);
        break;
      case CheeseType.pecorino:
        writer.writeByte(7);
        break;
      case CheeseType.gouda:
        writer.writeByte(8);
        break;
      case CheeseType.maasdam:
        writer.writeByte(9);
        break;
      case CheeseType.brie:
        writer.writeByte(10);
        break;
      case CheeseType.dorblu:
        writer.writeByte(11);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheeseTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
