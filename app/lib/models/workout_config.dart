import 'package:app/models/settings.dart';
import 'package:flutter/foundation.dart';

class WorkoutConfig {
  GeneralConfig _generalConfig = GeneralConfig.basic();
  HoldConfig _holdConfig = HoldConfig.basic();
  ExtraConfig _extraConfig = ExtraConfig.basic();

  GeneralConfig get generalConfig => _generalConfig;
  HoldConfig get holdConfig => _holdConfig;
  ExtraConfig get extraConfig => _extraConfig;

  void setConfig(ControlSettings settings) {
    _toggleAddedWeight(settings.addedWeight);
    _toggleAdvancedTimers(settings.advancedTimers);
    _toggleBoardSelection(settings.boardSelection);
    _toggleAllGrips(settings.allGrips);
    _toggleOneHanded(settings.oneHanded);
    _toggleVariableRepetitions(settings.variableRepetitions);
  }

  void _toggleAddedWeight(bool addedWeight) {
    _holdConfig.addedWeight = addedWeight;
  }

  void _toggleAdvancedTimers(bool advancedTimers) {
    _generalConfig.hangTime = !advancedTimers;
    _generalConfig.restBetweenRepetitions = !advancedTimers;

    _holdConfig.hangTime = advancedTimers;
    _holdConfig.restBetweenRepetitions = advancedTimers;
    _holdConfig.restBetweenHolds = advancedTimers;
  }

  void _toggleBoardSelection(bool board) {
    _generalConfig.board = board;
  }

  void _toggleAllGrips(bool advancedGrips) {
    _holdConfig.basicGrips = !advancedGrips;
    _holdConfig.advancedGrips = advancedGrips;
  }

  void _toggleOneHanded(bool oneHanded) {
    _holdConfig.oneHanded = oneHanded;
  }

  void _toggleVariableRepetitions(bool variableRepetitions) {
    _generalConfig.repetitions = !variableRepetitions;
    _holdConfig.repetitions = variableRepetitions;
  }
}

class GeneralConfig {
  GeneralConfig(
      {@required this.hangTime,
      @required this.restBetweenHolds,
      @required this.restBetweenSets,
      @required this.restBetweenRepetitions,
      @required this.repetitions,
      @required this.holdAmount,
      @required this.board,
      @required this.sets});

  GeneralConfig.basic() {
    this.holdAmount = true;
    this.repetitions = true;
    this.sets = true;
    this.restBetweenHolds = true;
    this.restBetweenRepetitions = true;
    this.restBetweenSets = true;
    this.hangTime = true;
    this.board = false;
  }

  bool holdAmount;
  bool repetitions;
  bool sets;
  bool restBetweenHolds;
  bool restBetweenRepetitions;
  bool restBetweenSets;
  bool hangTime;
  bool board;
}

class HoldConfig {
  HoldConfig(
      {@required this.basicGrips,
      @required this.advancedGrips,
      @required this.oneHanded,
      @required this.repetitions,
      @required this.hangTime,
      @required this.restBetweenRepetitions,
      @required this.restBetweenHolds,
      @required this.addedWeight});

  HoldConfig.basic() {
    this.basicGrips = true;
    this.advancedGrips = false;
    this.oneHanded = false;
    this.repetitions = false;
    this.hangTime = false;
    this.restBetweenRepetitions = false;
    this.restBetweenHolds = false;
    this.addedWeight = false;
  }

  bool basicGrips;
  bool advancedGrips;
  bool oneHanded;
  bool repetitions;
  bool hangTime;
  bool restBetweenRepetitions;
  bool restBetweenHolds;
  bool addedWeight;
}

class ExtraConfig {
  ExtraConfig({@required this.difficulty, @required this.name});

  ExtraConfig.basic() {
    this.difficulty = true;
    this.name = true;
  }

  bool difficulty;
  bool name;
}
