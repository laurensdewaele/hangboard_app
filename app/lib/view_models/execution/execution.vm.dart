import 'package:app/models/models.dart';
import 'package:app/routes/routes.dart';
import 'package:app/screens/congratulations.screen.dart';
import 'package:app/services/audio_player.service.dart';
import 'package:app/services/navigation.service.dart';
import 'package:app/view_models/execution/execution_sequence_builder.dart';
import 'package:app/view_models/execution/execution_state.vm.dart';
import 'package:app/view_models/execution/log_hangs_dialog.vm.dart';
import 'package:app/widgets/execution/log_hangs_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wakelock/wakelock.dart';

class ExecutionViewModel {
  AudioPlayerService _audioPlayerService;
  Workout _workout;
  AnimationController _animationController;
  int _currentSequenceIndex;
  List<SequenceTimer> _sequence;
  NavigationService _navigationService;
  List<PastHang> get pastHangs => _getPastHangs();
  int get totalHangs => _workout.totalHangs;
  double get _effectiveDurationMs => _getEffectiveDurationMs();
  int get _displaySeconds => _getDisplaySeconds();

  BehaviorSubject<ExecutionState> _state$;
  Stream<ExecutionState> get state$ => _state$.stream;
  ExecutionState get state => _state$.value;

  ExecutionViewModel(
      {@required Workout workout,
      @required AnimationController animationController}) {
    Wakelock.enable();
    _audioPlayerService = AudioPlayerService();
    _workout = workout;
    _animationController = animationController;
    _sequence = sequenceBuilder(workout: workout);
    _navigationService = NavigationService();
    _currentSequenceIndex = 0;
    _state$ = BehaviorSubject.seeded(_buildStateAndPlayBeepSound());
    _animationController.addListener(_setState);
    _animationController.addStatusListener(_animationStatusListener);
    _start();
  }

  List<PastHang> _getPastHangs() {
    final List<SequenceTimer> _pastHangEvents = _sequence
        .where((SequenceTimer t) =>
            t.type == SequenceTimerType.hangTimer &&
            t.currentHang < state.currentHang)
        .toList();
    return _pastHangEvents.map((SequenceTimer t) {
      final double _effectiveDurationS =
          double.parse((t.effectiveDurationMs / 1000).toStringAsFixed(1));
      return PastHang(
        skipped: t.skipped,
        effectiveDurationS: _effectiveDurationS,
        effectiveDurationSInput: _effectiveDurationS.toString(),
        addedWeight: t.addedWeight,
        addedWeightInput: t.addedWeight.toString(),
        totalSets: t.totalSets,
        totalHangsPerSet: t.totalHangsPerSet,
        currentHangPerSet: t.currentHangPerSet,
        currentSet: t.currentSet,
        currentHang: t.currentHang,
        isSelected: t.currentHang == state.currentHang - 1,
        boardAspectRatio: t.board.aspectRatio,
        rightGrip: t.rightGrip,
        leftGrip: t.leftGrip,
        leftGripBoardHold: t.leftGripBoardHold,
        rightGripBoardHold: t.rightGripBoardHold,
        handToBoardHeightRatio: t.board.handToBoardHeightRatio,
        customBoardHoldImages: t.board.customBoardHoldImages?.toList(),
        imageAsset: t.board.imageAsset,
        weightUnit: t.weightSystem.unit,
        imageAssetWidth: t.board.imageAssetWidth,
      );
    }).toList();
  }

  ExecutionState _buildStateAndPlayBeepSound() {
    // Can't use state.type here because it's possible state has not been initialized yet.
    final bool _isStopwatch = _sequence[_currentSequenceIndex].type ==
        SequenceTimerType.stopwatchRestTimer;
    final bool _isCountdown = !_isStopwatch;
    if (_state$ != null &&
        _isCountdown == true &&
        state.beepSound.muted == false &&
        _displaySeconds != state.displaySeconds &&
        _displaySeconds != 0 &&
        _displaySeconds <= state.beepsBeforeEnd) {
      _audioPlayerService.play(state.beepSound.filename);
    }

    return ExecutionState(
      currentHang: _sequence[_currentSequenceIndex].currentHang,
      type: _sequence[_currentSequenceIndex].type,
      isStopwatch: _isStopwatch,
      duration: _sequence[_currentSequenceIndex].duration,
      displaySeconds: _displaySeconds,
      animatedBackgroundHeightFactor:
          _isStopwatch == false ? _animationController.value : 0,
      endSound: _sequence[_currentSequenceIndex].endSound,
      beepSound: _sequence[_currentSequenceIndex].beepSound,
      beepsBeforeEnd: _sequence[_currentSequenceIndex].beepsBeforeEnd,
      primaryColor: _sequence[_currentSequenceIndex].primaryColor,
      title: _sequence[_currentSequenceIndex].title,
      holdLabel: _sequence[_currentSequenceIndex].holdLabel,
      board: _sequence[_currentSequenceIndex].board,
      leftGrip: _sequence[_currentSequenceIndex].leftGrip,
      rightGrip: _sequence[_currentSequenceIndex].rightGrip,
      leftGripBoardHold: _sequence[_currentSequenceIndex].leftGripBoardHold,
      rightGripBoardHold: _sequence[_currentSequenceIndex].rightGripBoardHold,
      totalSets: _sequence[_currentSequenceIndex].totalSets,
      currentSet: _sequence[_currentSequenceIndex].currentSet,
      totalHangsPerSet: _sequence[_currentSequenceIndex].totalHangsPerSet,
      currentHangPerSet: _sequence[_currentSequenceIndex].currentHangPerSet,
      weightSystem: _sequence[_currentSequenceIndex].weightSystem,
      addedWeight: _sequence[_currentSequenceIndex].addedWeight,
    );
  }

  void _setState() {
    _state$.add(_buildStateAndPlayBeepSound());
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (state.endSound.muted == false) {
        _audioPlayerService.play(state.endSound.filename);
      }
      _nextSequence();
    }
  }

  void _nextSequence() {
    final bool _lastSequence = _currentSequenceIndex == _sequence.length - 1;
    if (_lastSequence == true) {
      _stop();
    } else {
      _currentSequenceIndex++;
      if (_sequence[_currentSequenceIndex].skipped == true) {
        _nextSequence();
      }
      _setState();
      _start();
    }
  }

  void _start() {
    if (state.isStopwatch == true) {
      final int _kMaxStopwatchDuration = 10;
      _animationController.duration = Duration(minutes: _kMaxStopwatchDuration);
      _animationController.reset();
      _animationController.forward();
    } else {
      final int _seconds = state.duration;
      _animationController.duration = Duration(seconds: _seconds);
      _animationController.reset();
      _animationController.forward();
    }
  }

  void _stop() {
    _animationController.stop(canceled: true);

    _sequence = _sequence.map((SequenceTimer t) {
      if (_currentSequenceIndex == t.index) {
        return t.copyWith(
            stopped: true, effectiveDurationMs: _effectiveDurationMs);
      }
      if (t.index > _currentSequenceIndex) {
        return t.copyWith(stopped: true, effectiveDurationMs: 0);
      }
      return t;
    }).toList();

    History _history = _generateHistory();
    if (_history.timerUnderTensionMs == 0) {
      _navigationService.pushNamed(Routes.workoutOverviewScreen);
    } else {
      _navigationService.pushNamed(Routes.congratulationsScreen,
          arguments:
              RateWorkoutArguments(workout: _workout, history: _history));
    }
    dispose();
  }

  History _generateHistory() {
    final List<SequenceTimerLog> _logs = _sequence
        .map((SequenceTimer t) => SequenceTimerLog((b) => b
          ..effectiveDurationMs = t.effectiveDurationMs
          ..duration = t.duration
          ..type = t.type
          ..skipped = t.skipped
          ..stopped = t.stopped))
        .toList();

    return History((b) => b..sequenceTimerLogs.addAll(_logs));
  }

  void handleReadyTap() {
    _animationController.stop(canceled: false);
    _sequence[_currentSequenceIndex] = _sequence[_currentSequenceIndex]
        .copyWith(effectiveDurationMs: _effectiveDurationMs);
    _nextSequence();
  }

  void handlePauseTap() {
    _animationController.stop(canceled: false);
  }

  void handleSkipTap() {
    if (state.type == SequenceTimerType.hangTimer) {
      _sequence[_currentSequenceIndex] = _sequence[_currentSequenceIndex]
          .copyWith(effectiveDurationMs: _effectiveDurationMs, skipped: true);
      _navigationService.pop();
      _nextSequence();
      return;
    }

    final _nextHang = _sequence.firstWhere(
        (SequenceTimer t) =>
            t.skipped != true &&
            t.currentHang > state.currentHang &&
            t.type == SequenceTimerType.hangTimer,
        orElse: () => null);

    if (_nextHang == null) {
      _stop();
      return;
    }

    _sequence[_currentSequenceIndex] =
        _sequence[_currentSequenceIndex].copyWith(
      addedWeight: _nextHang.addedWeight,
      leftGripBoardHold: _nextHang.leftGripBoardHold,
      rightGripBoardHold: _nextHang.rightGripBoardHold,
      leftGrip: _nextHang.leftGrip,
      rightGrip: _nextHang.rightGrip,
      holdLabel: _nextHang.holdLabel,
      board: _nextHang.board,
      currentSet: _nextHang.currentSet,
      currentHangPerSet: _nextHang.currentHangPerSet,
      currentHang: _nextHang.currentHang,
    );

    _sequence = _sequence.map((SequenceTimer t) {
      // If we're currently on the stopwatch rest timer,
      // we still need the preparation sequence before
      // the next hang.
      if (state.isStopwatch == true &&
          t.index > _currentSequenceIndex &&
          t.index < _nextHang.index - 1) {
        return t.copyWith(effectiveDurationMs: 0, skipped: true);
      }
      if (state.isStopwatch == false &&
          t.index > _currentSequenceIndex &&
          t.index < _nextHang.index) {
        return t.copyWith(effectiveDurationMs: 0, skipped: true);
      }
      return t;
    }).toList();

    _setState();
    _animationController.forward();
    _navigationService.pop();
  }

  void handleStopTap() {
    _stop();
  }

  void handleResumeTap() {
    _animationController.forward();
    _navigationService.pop();
  }

  int _getDisplaySeconds() {
    if (_state$ == null) {
      return _sequence[_currentSequenceIndex].duration;
    }

    if (state.isStopwatch == true) {
      return (_animationController.duration.inSeconds *
              _animationController.value)
          .ceil();
    } else {
      return (_animationController.duration.inSeconds -
              _animationController.duration.inSeconds *
                  _animationController.value)
          .ceil();
    }
  }

  double _getEffectiveDurationMs() {
    return (_animationController.duration.inMilliseconds *
        _animationController.value);
  }

  void handleLoggedHangs(List<LoggedHang> loggedHangs) {
    _sequence = _sequence.map((SequenceTimer t) {
      final _relevantLoggedHang = loggedHangs.firstWhere(
          (LoggedHang loggedHang) => t.currentHang == loggedHang.currentHang,
          orElse: () => null);

      if (t.type == SequenceTimerType.hangTimer &&
          _relevantLoggedHang != null) {
        return t.copyWith(
            effectiveDurationMs: _relevantLoggedHang.effectiveDurationS * 1000,
            addedWeight: _relevantLoggedHang.addedWeight);
      }

      return t;
    }).toList();
  }

  void dispose() {
    Wakelock.disable();
    _animationController.removeListener(_setState);
    _animationController.removeStatusListener(_animationStatusListener);
    _animationController.dispose();
    _state$.close();
  }
}
