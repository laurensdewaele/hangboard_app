import 'package:flutter/cupertino.dart';

import 'package:app/models/models.dart';

@immutable
class HoldPageState {
  final int currentHoldIndex;
  final Board board;
  final bool inputsEnabled;
  final Color primaryColor;
  final TextStyle textPrimaryColor;
  final String weightUnitDescription;
  final int currentHold;
  final int totalHolds;

  final HandHold handHold;
  final Grip leftGrip;
  final Grip rightGrip;
  final BoardHold leftGripBoardHold;
  final BoardHold rightGripBoardHold;
  final int repetitions;
  final int restBetweenRepetitions;
  final int hangTime;
  final double addedWeight;

  final String repetitionsInput;
  final String restBetweenRepetitionsInput;
  final String hangTimeInput;
  final String addedWeightInput;

  const HoldPageState({
    @required this.currentHoldIndex,
    @required this.board,
    @required this.inputsEnabled,
    @required this.primaryColor,
    @required this.textPrimaryColor,
    @required this.weightUnitDescription,
    @required this.currentHold,
    @required this.totalHolds,
    @required this.handHold,
    @required this.leftGrip,
    @required this.rightGrip,
    @required this.leftGripBoardHold,
    @required this.rightGripBoardHold,
    @required this.repetitions,
    @required this.restBetweenRepetitions,
    @required this.hangTime,
    @required this.addedWeight,
    @required this.repetitionsInput,
    @required this.restBetweenRepetitionsInput,
    @required this.hangTimeInput,
    @required this.addedWeightInput,
  });

  HoldPageState copyWith({
    int currentHoldIndex,
    Board board,
    bool inputsEnabled,
    Color primaryColor,
    TextStyle textPrimaryColor,
    String weightUnitDescription,
    int currentHold,
    int totalHolds,
    HandHold handHold,
    Grip leftGrip,
    Grip rightGrip,
    BoardHold leftGripBoardHold,
    BoardHold rightGripBoardHold,
    int repetitions,
    int restBetweenRepetitions,
    int hangTime,
    double addedWeight,
    String repetitionsInput,
    String restBetweenRepetitionsInput,
    String hangTimeInput,
    String addedWeightInput,
  }) {
    return new HoldPageState(
      currentHoldIndex: currentHoldIndex ?? this.currentHoldIndex,
      board: board ?? this.board,
      inputsEnabled: inputsEnabled ?? this.inputsEnabled,
      primaryColor: primaryColor ?? this.primaryColor,
      textPrimaryColor: textPrimaryColor ?? this.textPrimaryColor,
      weightUnitDescription:
          weightUnitDescription ?? this.weightUnitDescription,
      currentHold: currentHold ?? this.currentHold,
      totalHolds: totalHolds ?? this.totalHolds,
      handHold: handHold ?? this.handHold,
      leftGrip: leftGrip ?? this.leftGrip,
      rightGrip: rightGrip ?? this.rightGrip,
      leftGripBoardHold: leftGripBoardHold ?? this.leftGripBoardHold,
      rightGripBoardHold: rightGripBoardHold ?? this.rightGripBoardHold,
      repetitions: repetitions ?? this.repetitions,
      restBetweenRepetitions:
          restBetweenRepetitions ?? this.restBetweenRepetitions,
      hangTime: hangTime ?? this.hangTime,
      addedWeight: addedWeight ?? this.addedWeight,
      repetitionsInput: repetitionsInput ?? this.repetitionsInput,
      restBetweenRepetitionsInput:
          restBetweenRepetitionsInput ?? this.restBetweenRepetitionsInput,
      hangTimeInput: hangTimeInput ?? this.hangTimeInput,
      addedWeightInput: addedWeightInput ?? this.addedWeightInput,
    );
  }
}