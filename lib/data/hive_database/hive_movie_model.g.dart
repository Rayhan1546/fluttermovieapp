// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<HiveMovieModel> {
  @override
  final int typeId = 0;

  @override
  HiveMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMovieModel(
      fields[0] as String?,
      fields[1] as int?,
      fields[2] as String?,
      fields[4] as dynamic,
      fields[5] as String?,
      fields[6] as int?,
      fields[3] as int?,
      (fields[7] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveMovieModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.largecoverimage)
      ..writeByte(6)
      ..write(obj.runtime)
      ..writeByte(7)
      ..write(obj.genres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
