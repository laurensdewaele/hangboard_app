import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:app/models/board.dart';
import 'package:app/models/serializers.dart';
import 'package:app/models/sound.dart';
import 'package:app/models/unit.dart';

part 'settings.g.dart';

abstract class Settings implements Built<Settings, SettingsBuilder> {
  static Serializer<Settings> get serializer => _$settingsSerializer;

  Board get defaultBoard;
  int get preparationTimer;
  Sound get hangSound;
  Sound get restSound;
  Unit get unit;

  factory Settings([void Function(SettingsBuilder) updates]) = _$Settings;
  Settings._();

  String toJson() {
    return json.encode(serializers.serializeWith(Settings.serializer, this));
  }

  static Settings fromJson(String jsonString) {
    return serializers.deserializeWith(
        Settings.serializer, json.decode(jsonString));
  }
}