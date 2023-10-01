// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageCMAdapter extends TypeAdapter<LanguageCM> {
  @override
  final int typeId = 4;

  @override
  LanguageCM read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LanguageCM.arabic;
      case 1:
        return LanguageCM.english;
      default:
        return LanguageCM.arabic;
    }
  }

  @override
  void write(BinaryWriter writer, LanguageCM obj) {
    switch (obj) {
      case LanguageCM.arabic:
        writer.writeByte(0);
        break;
      case LanguageCM.english:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
