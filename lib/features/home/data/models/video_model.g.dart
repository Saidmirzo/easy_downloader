// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoModelAdapter extends TypeAdapter<VideoModel> {
  @override
  final int typeId = 0;

  @override
  VideoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoModel(
      url: fields[0] as String?,
      size: fields[1] as int?,
      quality: fields[2] as String?,
      witdth: fields[3] as int?,
      height: fields[4] as int?,
      fps: fields[5] as int?,
      container: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VideoModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.quality)
      ..writeByte(3)
      ..write(obj.witdth)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.fps)
      ..writeByte(6)
      ..write(obj.container);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
