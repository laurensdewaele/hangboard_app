import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'package:app/models/board_hold.dart';
import 'package:app/models/grip.dart';
import 'package:app/models/hold_type.dart';
import 'package:app/models/unit.dart';
import 'package:app/styles/styles.dart' as styles;

class LandscapeInfo extends StatelessWidget {
  LandscapeInfo(
      {this.addedWeight,
      this.unit,
      this.leftGrip,
      this.leftGripBoardHold,
      this.rightGrip,
      this.rightGripBoardHold});

  final double addedWeight;
  final Unit unit;
  final Grip leftGrip;
  final BoardHold leftGripBoardHold;
  final Grip rightGrip;
  final BoardHold rightGripBoardHold;

  @override
  Widget build(BuildContext context) {
    String leftGripName;
    String leftHoldInfo;
    if (leftGrip != null && leftGripBoardHold != null) {
      leftGripName = leftGrip.description;
      if (leftGripBoardHold.holdType == HoldType.pocket ||
          leftGripBoardHold.holdType == HoldType.roundedPocket) {
        final String pocketDepth = leftGripBoardHold.pocketDepth.toString();
        leftHoldInfo = '$pocketDepth MM';
      } else {
        leftHoldInfo = leftGripBoardHold.holdType.toString();
      }
    }

    String rightGripName;
    String rightHoldInfo;
    if (rightGrip != null && rightGripBoardHold != null) {
      rightGripName = rightGrip.description;
      if (rightGripBoardHold.holdType == HoldType.pocket ||
          rightGripBoardHold.holdType == HoldType.roundedPocket) {
        final String pocketDepth = rightGripBoardHold.pocketDepth.toString();
        rightHoldInfo = '$pocketDepth MM';
      } else {
        rightHoldInfo = rightGripBoardHold.holdType.toString();
      }
    }

    final String _unitText = unit == Unit.metric ? 'kg' : 'lb';

    return Container(
        decoration: BoxDecoration(
            borderRadius: styles.kBorderRadiusAll,
            color: styles.Colors.darkGray,
            boxShadow: [styles.kBoxShadow]),
        padding: EdgeInsets.symmetric(
            vertical: styles.Measurements.xs,
            horizontal: styles.Measurements.m),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              fit: StackFit.loose,
              children: <Widget>[
                if (leftGripName != null && leftHoldInfo != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            leftGripName,
                            style: styles.Typography.countdownLandscapeInfo,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            leftHoldInfo,
                            style: styles.Typography.countdownLandscapeInfo,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      '+ $addedWeight $_unitText',
                      style: styles.Typography.countdownAddedWeight,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if (rightGripName != null && rightHoldInfo != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            rightGripName,
                            style: styles.Typography.countdownLandscapeInfo,
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            rightHoldInfo,
                            style: styles.Typography.countdownLandscapeInfo,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ));
  }
}
