// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Settings> _$settingsSerializer = new _$SettingsSerializer();

class _$SettingsSerializer implements StructuredSerializer<Settings> {
  @override
  final Iterable<Type> types = const [Settings, _$Settings];
  @override
  final String wireName = 'Settings';

  @override
  Iterable<Object> serialize(Serializers serializers, Settings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'defaultBoard',
      serializers.serialize(object.defaultBoard,
          specifiedType: const FullType(Board)),
      'preparationTimer',
      serializers.serialize(object.preparationTimer,
          specifiedType: const FullType(int)),
      'hangSound',
      serializers.serialize(object.hangSound,
          specifiedType: const FullType(Sound)),
      'beepDuringHangSound',
      serializers.serialize(object.beepDuringHangSound,
          specifiedType: const FullType(Sound)),
      'beepDuringRestSound',
      serializers.serialize(object.beepDuringRestSound,
          specifiedType: const FullType(Sound)),
      'repRestSound',
      serializers.serialize(object.repRestSound,
          specifiedType: const FullType(Sound)),
      'gripRestSound',
      serializers.serialize(object.gripRestSound,
          specifiedType: const FullType(Sound)),
      'setRestSound',
      serializers.serialize(object.setRestSound,
          specifiedType: const FullType(Sound)),
      'beepsBeforeHang',
      serializers.serialize(object.beepsBeforeHang,
          specifiedType: const FullType(int)),
      'beepsBeforeRest',
      serializers.serialize(object.beepsBeforeRest,
          specifiedType: const FullType(int)),
      'unit',
      serializers.serialize(object.unit, specifiedType: const FullType(Unit)),
    ];

    return result;
  }

  @override
  Settings deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'defaultBoard':
          result.defaultBoard.replace(serializers.deserialize(value,
              specifiedType: const FullType(Board)) as Board);
          break;
        case 'preparationTimer':
          result.preparationTimer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hangSound':
          result.hangSound.replace(serializers.deserialize(value,
              specifiedType: const FullType(Sound)) as Sound);
          break;
        case 'beepDuringHangSound':
          result.beepDuringHangSound.replace(serializers.deserialize(value,
              specifiedType: const FullType(Sound)) as Sound);
          break;
        case 'beepDuringRestSound':
          result.beepDuringRestSound.replace(serializers.deserialize(value,
              specifiedType: const FullType(Sound)) as Sound);
          break;
        case 'repRestSound':
          result.repRestSound.replace(serializers.deserialize(value,
              specifiedType: const FullType(Sound)) as Sound);
          break;
        case 'gripRestSound':
          result.gripRestSound.replace(serializers.deserialize(value,
              specifiedType: const FullType(Sound)) as Sound);
          break;
        case 'setRestSound':
          result.setRestSound.replace(serializers.deserialize(value,
              specifiedType: const FullType(Sound)) as Sound);
          break;
        case 'beepsBeforeHang':
          result.beepsBeforeHang = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'beepsBeforeRest':
          result.beepsBeforeRest = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'unit':
          result.unit = serializers.deserialize(value,
              specifiedType: const FullType(Unit)) as Unit;
          break;
      }
    }

    return result.build();
  }
}

class _$Settings extends Settings {
  @override
  final Board defaultBoard;
  @override
  final int preparationTimer;
  @override
  final Sound hangSound;
  @override
  final Sound beepDuringHangSound;
  @override
  final Sound beepDuringRestSound;
  @override
  final Sound repRestSound;
  @override
  final Sound gripRestSound;
  @override
  final Sound setRestSound;
  @override
  final int beepsBeforeHang;
  @override
  final int beepsBeforeRest;
  @override
  final Unit unit;

  factory _$Settings([void Function(SettingsBuilder) updates]) =>
      (new SettingsBuilder()..update(updates)).build();

  _$Settings._(
      {this.defaultBoard,
      this.preparationTimer,
      this.hangSound,
      this.beepDuringHangSound,
      this.beepDuringRestSound,
      this.repRestSound,
      this.gripRestSound,
      this.setRestSound,
      this.beepsBeforeHang,
      this.beepsBeforeRest,
      this.unit})
      : super._() {
    if (defaultBoard == null) {
      throw new BuiltValueNullFieldError('Settings', 'defaultBoard');
    }
    if (preparationTimer == null) {
      throw new BuiltValueNullFieldError('Settings', 'preparationTimer');
    }
    if (hangSound == null) {
      throw new BuiltValueNullFieldError('Settings', 'hangSound');
    }
    if (beepDuringHangSound == null) {
      throw new BuiltValueNullFieldError('Settings', 'beepDuringHangSound');
    }
    if (beepDuringRestSound == null) {
      throw new BuiltValueNullFieldError('Settings', 'beepDuringRestSound');
    }
    if (repRestSound == null) {
      throw new BuiltValueNullFieldError('Settings', 'repRestSound');
    }
    if (gripRestSound == null) {
      throw new BuiltValueNullFieldError('Settings', 'gripRestSound');
    }
    if (setRestSound == null) {
      throw new BuiltValueNullFieldError('Settings', 'setRestSound');
    }
    if (beepsBeforeHang == null) {
      throw new BuiltValueNullFieldError('Settings', 'beepsBeforeHang');
    }
    if (beepsBeforeRest == null) {
      throw new BuiltValueNullFieldError('Settings', 'beepsBeforeRest');
    }
    if (unit == null) {
      throw new BuiltValueNullFieldError('Settings', 'unit');
    }
  }

  @override
  Settings rebuild(void Function(SettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsBuilder toBuilder() => new SettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Settings &&
        defaultBoard == other.defaultBoard &&
        preparationTimer == other.preparationTimer &&
        hangSound == other.hangSound &&
        beepDuringHangSound == other.beepDuringHangSound &&
        beepDuringRestSound == other.beepDuringRestSound &&
        repRestSound == other.repRestSound &&
        gripRestSound == other.gripRestSound &&
        setRestSound == other.setRestSound &&
        beepsBeforeHang == other.beepsBeforeHang &&
        beepsBeforeRest == other.beepsBeforeRest &&
        unit == other.unit;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, defaultBoard.hashCode),
                                            preparationTimer.hashCode),
                                        hangSound.hashCode),
                                    beepDuringHangSound.hashCode),
                                beepDuringRestSound.hashCode),
                            repRestSound.hashCode),
                        gripRestSound.hashCode),
                    setRestSound.hashCode),
                beepsBeforeHang.hashCode),
            beepsBeforeRest.hashCode),
        unit.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Settings')
          ..add('defaultBoard', defaultBoard)
          ..add('preparationTimer', preparationTimer)
          ..add('hangSound', hangSound)
          ..add('beepDuringHangSound', beepDuringHangSound)
          ..add('beepDuringRestSound', beepDuringRestSound)
          ..add('repRestSound', repRestSound)
          ..add('gripRestSound', gripRestSound)
          ..add('setRestSound', setRestSound)
          ..add('beepsBeforeHang', beepsBeforeHang)
          ..add('beepsBeforeRest', beepsBeforeRest)
          ..add('unit', unit))
        .toString();
  }
}

class SettingsBuilder implements Builder<Settings, SettingsBuilder> {
  _$Settings _$v;

  BoardBuilder _defaultBoard;
  BoardBuilder get defaultBoard => _$this._defaultBoard ??= new BoardBuilder();
  set defaultBoard(BoardBuilder defaultBoard) =>
      _$this._defaultBoard = defaultBoard;

  int _preparationTimer;
  int get preparationTimer => _$this._preparationTimer;
  set preparationTimer(int preparationTimer) =>
      _$this._preparationTimer = preparationTimer;

  SoundBuilder _hangSound;
  SoundBuilder get hangSound => _$this._hangSound ??= new SoundBuilder();
  set hangSound(SoundBuilder hangSound) => _$this._hangSound = hangSound;

  SoundBuilder _beepDuringHangSound;
  SoundBuilder get beepDuringHangSound =>
      _$this._beepDuringHangSound ??= new SoundBuilder();
  set beepDuringHangSound(SoundBuilder beepDuringHangSound) =>
      _$this._beepDuringHangSound = beepDuringHangSound;

  SoundBuilder _beepDuringRestSound;
  SoundBuilder get beepDuringRestSound =>
      _$this._beepDuringRestSound ??= new SoundBuilder();
  set beepDuringRestSound(SoundBuilder beepDuringRestSound) =>
      _$this._beepDuringRestSound = beepDuringRestSound;

  SoundBuilder _repRestSound;
  SoundBuilder get repRestSound => _$this._repRestSound ??= new SoundBuilder();
  set repRestSound(SoundBuilder repRestSound) =>
      _$this._repRestSound = repRestSound;

  SoundBuilder _gripRestSound;
  SoundBuilder get gripRestSound =>
      _$this._gripRestSound ??= new SoundBuilder();
  set gripRestSound(SoundBuilder gripRestSound) =>
      _$this._gripRestSound = gripRestSound;

  SoundBuilder _setRestSound;
  SoundBuilder get setRestSound => _$this._setRestSound ??= new SoundBuilder();
  set setRestSound(SoundBuilder setRestSound) =>
      _$this._setRestSound = setRestSound;

  int _beepsBeforeHang;
  int get beepsBeforeHang => _$this._beepsBeforeHang;
  set beepsBeforeHang(int beepsBeforeHang) =>
      _$this._beepsBeforeHang = beepsBeforeHang;

  int _beepsBeforeRest;
  int get beepsBeforeRest => _$this._beepsBeforeRest;
  set beepsBeforeRest(int beepsBeforeRest) =>
      _$this._beepsBeforeRest = beepsBeforeRest;

  Unit _unit;
  Unit get unit => _$this._unit;
  set unit(Unit unit) => _$this._unit = unit;

  SettingsBuilder();

  SettingsBuilder get _$this {
    if (_$v != null) {
      _defaultBoard = _$v.defaultBoard?.toBuilder();
      _preparationTimer = _$v.preparationTimer;
      _hangSound = _$v.hangSound?.toBuilder();
      _beepDuringHangSound = _$v.beepDuringHangSound?.toBuilder();
      _beepDuringRestSound = _$v.beepDuringRestSound?.toBuilder();
      _repRestSound = _$v.repRestSound?.toBuilder();
      _gripRestSound = _$v.gripRestSound?.toBuilder();
      _setRestSound = _$v.setRestSound?.toBuilder();
      _beepsBeforeHang = _$v.beepsBeforeHang;
      _beepsBeforeRest = _$v.beepsBeforeRest;
      _unit = _$v.unit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Settings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Settings;
  }

  @override
  void update(void Function(SettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Settings build() {
    _$Settings _$result;
    try {
      _$result = _$v ??
          new _$Settings._(
              defaultBoard: defaultBoard.build(),
              preparationTimer: preparationTimer,
              hangSound: hangSound.build(),
              beepDuringHangSound: beepDuringHangSound.build(),
              beepDuringRestSound: beepDuringRestSound.build(),
              repRestSound: repRestSound.build(),
              gripRestSound: gripRestSound.build(),
              setRestSound: setRestSound.build(),
              beepsBeforeHang: beepsBeforeHang,
              beepsBeforeRest: beepsBeforeRest,
              unit: unit);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'defaultBoard';
        defaultBoard.build();

        _$failedField = 'hangSound';
        hangSound.build();
        _$failedField = 'beepDuringHangSound';
        beepDuringHangSound.build();
        _$failedField = 'beepDuringRestSound';
        beepDuringRestSound.build();
        _$failedField = 'repRestSound';
        repRestSound.build();
        _$failedField = 'gripRestSound';
        gripRestSound.build();
        _$failedField = 'setRestSound';
        setRestSound.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Settings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
