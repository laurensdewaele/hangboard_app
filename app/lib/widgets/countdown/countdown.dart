import 'package:flutter/cupertino.dart';

import 'package:audioplayers/audio_cache.dart';

import 'package:app/models/models.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/widgets/countdown/portrait.dart';
import 'package:app/widgets/countdown/landscape.dart';

class Countdown extends StatefulWidget {
  Countdown({
    Key key,
    @required this.animatedBackgroundHeightFactor,
    @required this.primaryColor,
    @required this.title,
    @required this.remainingSeconds,
    @required this.holdLabel,
    @required this.board,
    this.leftGrip,
    this.leftGripBoardHold,
    this.rightGrip,
    this.rightGripBoardHold,
    @required this.totalSets,
    @required this.currentSet,
    @required this.totalHangsPerSet,
    @required this.currentHang,
    @required this.weightUnit,
    @required this.endSound,
    @required this.beepSound,
    @required this.beepsBeforeEnd,
    this.addedWeight,
  }) : super(key: key);

  final Sound endSound;
  final Sound beepSound;
  final int beepsBeforeEnd;
  final double animatedBackgroundHeightFactor;
  final Color primaryColor;
  final String title;
  final int remainingSeconds;
  final String holdLabel;
  final Board board;
  final Grip leftGrip;
  final Grip rightGrip;
  final BoardHold leftGripBoardHold;
  final BoardHold rightGripBoardHold;
  final int totalSets;
  final int currentSet;
  final int totalHangsPerSet;
  final int currentHang;
  final WeightUnit weightUnit;
  final double addedWeight;

  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  AudioCache _audioPlayer = AudioCache(prefix: 'audio/');

  @override
  void didUpdateWidget(Countdown oldWidget) {
    if (oldWidget.remainingSeconds != widget.remainingSeconds) {
      if (widget.remainingSeconds == 0) {
        if (widget.endSound.muted != true) {
          _audioPlayer.play(widget.endSound.filename);
        }
      } else if (widget.remainingSeconds <= widget.beepsBeforeEnd) {
        if (widget.beepSound.muted != true) {
          _audioPlayer.play(widget.beepSound.filename);
        }
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    if (widget.remainingSeconds <= widget.beepsBeforeEnd) {
      if (widget.beepSound.muted != true) {
        _audioPlayer.play(widget.beepSound.filename);
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: Save progress of workout;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Orientation _orientation = MediaQuery.of(context).orientation;
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(color: styles.Colors.bgBlack),
      ),
      FractionallySizedBox(
          heightFactor: widget.animatedBackgroundHeightFactor,
          child: Container(
            decoration: BoxDecoration(color: widget.primaryColor),
          )),
      SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(styles.Measurements.m),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (_orientation == Orientation.portrait) {
                  return Portrait(
                    title: widget.title,
                    weightUnit: widget.weightUnit,
                    remainingSeconds: widget.remainingSeconds,
                    orientation: _orientation,
                    rightGripBoardHold: widget.rightGripBoardHold,
                    rightGrip: widget.rightGrip,
                    leftGripBoardHold: widget.leftGripBoardHold,
                    leftGrip: widget.leftGrip,
                    board: widget.board,
                    currentHang: widget.currentHang,
                    currentSet: widget.currentSet,
                    holdLabel: widget.holdLabel,
                    primaryColor: widget.primaryColor,
                    totalHangsPerSet: widget.totalHangsPerSet,
                    totalSets: widget.totalSets,
                    addedWeight: widget.addedWeight,
                  );
                } else {
                  return Landscape(
                    title: widget.title,
                    weightUnit: widget.weightUnit,
                    orientation: _orientation,
                    rightGripBoardHold: widget.rightGripBoardHold,
                    rightGrip: widget.rightGrip,
                    leftGripBoardHold: widget.leftGripBoardHold,
                    leftGrip: widget.leftGrip,
                    board: widget.board,
                    currentHang: widget.currentHang,
                    currentSet: widget.currentSet,
                    holdLabel: widget.holdLabel,
                    primaryColor: widget.primaryColor,
                    totalHangsPerSet: widget.totalHangsPerSet,
                    totalSets: widget.totalSets,
                    addedWeight: widget.addedWeight,
                  );
                }
              },
            )),
      ),
    ]);
  }
}
