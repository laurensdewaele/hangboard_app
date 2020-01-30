import 'dart:ui';

import 'package:app/models/board.dart';
import 'package:app/models/board_hold.dart';
import 'package:app/models/hold_type.dart';

const Size _kBoardSize = const Size(395.88, 100);

final List<BoardHold> boardHolds = [
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 55 / _kBoardSize.width
    ..dyRelativeHangAnchor = 0 / _kBoardSize.height
    ..relativeLeft = 0 / _kBoardSize.width
    ..relativeTop = 0 / _kBoardSize.height
    ..relativeWidth = 83 / _kBoardSize.width
    ..relativeHeight = 15 / _kBoardSize.height
    ..position = 1
    ..holdType = HoldType.jug
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 115 / _kBoardSize.width
    ..dyRelativeHangAnchor = 19 / _kBoardSize.height
    ..relativeLeft = 83 / _kBoardSize.width
    ..relativeTop = 0 / _kBoardSize.height
    ..relativeWidth = 64 / _kBoardSize.width
    ..relativeHeight = 19 / _kBoardSize.height
    ..position = 2
    ..sloperDegrees = 35
    ..holdType = HoldType.sloper
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = (147 + (50 / 2)) / _kBoardSize.width
    ..dyRelativeHangAnchor = 15 / _kBoardSize.height
    ..relativeLeft = 147 / _kBoardSize.width
    ..relativeTop = 0 / _kBoardSize.height
    ..relativeWidth = 50 / _kBoardSize.width
    ..relativeHeight = 15 / _kBoardSize.height
    ..position = 3
    ..sloperDegrees = 20
    ..holdType = HoldType.sloper
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = (197 + (53 / 2)) / _kBoardSize.width
    ..dyRelativeHangAnchor = 15 / _kBoardSize.height
    ..relativeLeft = 197 / _kBoardSize.width
    ..relativeTop = 0 / _kBoardSize.height
    ..relativeWidth = 53 / _kBoardSize.width
    ..relativeHeight = 15 / _kBoardSize.height
    ..position = 4
    ..sloperDegrees = 20
    ..holdType = HoldType.sloper
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = (250 + (64 / 2)) / _kBoardSize.width
    ..dyRelativeHangAnchor = 19 / _kBoardSize.height
    ..relativeLeft = 250 / _kBoardSize.width
    ..relativeTop = 0 / _kBoardSize.height
    ..relativeWidth = 64 / _kBoardSize.width
    ..relativeHeight = 19 / _kBoardSize.height
    ..position = 5
    ..sloperDegrees = 35
    ..holdType = HoldType.sloper
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 342 / _kBoardSize.width
    ..dyRelativeHangAnchor = 0 / _kBoardSize.height
    ..relativeLeft = 313 / _kBoardSize.width
    ..relativeTop = 0 / _kBoardSize.height
    ..relativeWidth = 83 / _kBoardSize.width
    ..relativeHeight = 15 / _kBoardSize.height
    ..position = 6
    ..holdType = HoldType.jug
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 45 / _kBoardSize.width
    ..dyRelativeHangAnchor = 33 / _kBoardSize.height
    ..relativeLeft = 0 / _kBoardSize.width
    ..relativeTop = 15 / _kBoardSize.height
    ..relativeWidth = 83 / _kBoardSize.width
    ..relativeHeight = 22 / _kBoardSize.height
    ..position = 7
    ..pocketDepth = 11
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 171 / _kBoardSize.width
    ..dyRelativeHangAnchor = 33 / _kBoardSize.height
    ..relativeLeft = 147 / _kBoardSize.width
    ..relativeTop = 15 / _kBoardSize.height
    ..relativeWidth = 50 / _kBoardSize.width
    ..relativeHeight = 22 / _kBoardSize.height
    ..position = 8
    ..pocketDepth = 30
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 3),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 224 / _kBoardSize.width
    ..dyRelativeHangAnchor = 33 / _kBoardSize.height
    ..relativeLeft = 197 / _kBoardSize.width
    ..relativeTop = 15 / _kBoardSize.height
    ..relativeWidth = 53 / _kBoardSize.width
    ..relativeHeight = 22 / _kBoardSize.height
    ..position = 9
    ..pocketDepth = 30
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 3),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 350 / _kBoardSize.width
    ..dyRelativeHangAnchor = 33 / _kBoardSize.height
    ..relativeLeft = 314 / _kBoardSize.width
    ..relativeTop = 15 / _kBoardSize.height
    ..relativeWidth = 82 / _kBoardSize.width
    ..relativeHeight = 22 / _kBoardSize.height
    ..position = 10
    ..pocketDepth = 11
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 36 / _kBoardSize.width
    ..dyRelativeHangAnchor = 57.5 / _kBoardSize.height
    ..relativeLeft = 0 / _kBoardSize.width
    ..relativeTop = 37 / _kBoardSize.height
    ..relativeWidth = 72 / _kBoardSize.width
    ..relativeHeight = 27 / _kBoardSize.height
    ..position = 11
    ..pocketDepth = 41.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 92.5 / _kBoardSize.width
    ..dyRelativeHangAnchor = 57.5 / _kBoardSize.height
    ..relativeLeft = 72 / _kBoardSize.width
    ..relativeTop = 37 / _kBoardSize.height
    ..relativeWidth = 40 / _kBoardSize.width
    ..relativeHeight = 27 / _kBoardSize.height
    ..position = 12
    ..pocketDepth = 41.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 2),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 137.5 / _kBoardSize.width
    ..dyRelativeHangAnchor = 57.5 / _kBoardSize.height
    ..relativeLeft = 112 / _kBoardSize.width
    ..relativeTop = 37 / _kBoardSize.height
    ..relativeWidth = 50 / _kBoardSize.width
    ..relativeHeight = 27 / _kBoardSize.height
    ..position = 13
    ..pocketDepth = 41.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 3),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 197.5 / _kBoardSize.width
    ..dyRelativeHangAnchor = 57.5 / _kBoardSize.height
    ..relativeLeft = 162 / _kBoardSize.width
    ..relativeTop = 37 / _kBoardSize.height
    ..relativeWidth = 72 / _kBoardSize.width
    ..relativeHeight = 27 / _kBoardSize.height
    ..position = 14
    ..pocketDepth = 48
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 260 / _kBoardSize.width
    ..dyRelativeHangAnchor = 57.5 / _kBoardSize.height
    ..relativeLeft = 234 / _kBoardSize.width
    ..relativeTop = 37 / _kBoardSize.height
    ..relativeWidth = 52 / _kBoardSize.width
    ..relativeHeight = 27 / _kBoardSize.height
    ..position = 15
    ..pocketDepth = 41.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 3),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 305 / _kBoardSize.width
    ..dyRelativeHangAnchor = 57.5 / _kBoardSize.height
    ..relativeLeft = 286 / _kBoardSize.width
    ..relativeTop = 37 / _kBoardSize.height
    ..relativeWidth = 39 / _kBoardSize.width
    ..relativeHeight = 27 / _kBoardSize.height
    ..position = 16
    ..pocketDepth = 46.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 2),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 360.5 / _kBoardSize.width
    ..dyRelativeHangAnchor = 57.5 / _kBoardSize.height
    ..relativeLeft = 325 / _kBoardSize.width
    ..relativeTop = 37 / _kBoardSize.height
    ..relativeWidth = 71 / _kBoardSize.width
    ..relativeHeight = 27 / _kBoardSize.height
    ..position = 17
    ..pocketDepth = 46.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 74 / _kBoardSize.width
    ..dyRelativeHangAnchor = 89.5 / _kBoardSize.height
    ..relativeLeft = 35 / _kBoardSize.width
    ..relativeTop = 64 / _kBoardSize.height
    ..relativeWidth = 72 / _kBoardSize.width
    ..relativeHeight = 36 / _kBoardSize.height
    ..position = 18
    ..pocketDepth = 15.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 5),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 127 / _kBoardSize.width
    ..dyRelativeHangAnchor = 89.5 / _kBoardSize.height
    ..relativeLeft = 107 / _kBoardSize.width
    ..relativeTop = 64 / _kBoardSize.height
    ..relativeWidth = 40 / _kBoardSize.width
    ..relativeHeight = 36 / _kBoardSize.height
    ..position = 19
    ..pocketDepth = 20.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 2),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 172 / _kBoardSize.width
    ..dyRelativeHangAnchor = 89.5 / _kBoardSize.height
    ..relativeLeft = 147 / _kBoardSize.width
    ..relativeTop = 64 / _kBoardSize.height
    ..relativeWidth = 50 / _kBoardSize.width
    ..relativeHeight = 36 / _kBoardSize.height
    ..position = 20
    ..pocketDepth = 15.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 3),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 224 / _kBoardSize.width
    ..dyRelativeHangAnchor = 89.5 / _kBoardSize.height
    ..relativeLeft = 197 / _kBoardSize.width
    ..relativeTop = 64 / _kBoardSize.height
    ..relativeWidth = 53 / _kBoardSize.width
    ..relativeHeight = 36 / _kBoardSize.height
    ..position = 21
    ..pocketDepth = 15.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 3),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 269 / _kBoardSize.width
    ..dyRelativeHangAnchor = 89.5 / _kBoardSize.height
    ..relativeLeft = 250 / _kBoardSize.width
    ..relativeTop = 64 / _kBoardSize.height
    ..relativeWidth = 39 / _kBoardSize.width
    ..relativeHeight = 36 / _kBoardSize.height
    ..position = 22
    ..pocketDepth = 20.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 2),
  BoardHold((b) => b
    ..dxRelativeHangAnchor = 322 / _kBoardSize.width
    ..dyRelativeHangAnchor = 89.5 / _kBoardSize.height
    ..relativeLeft = 289 / _kBoardSize.width
    ..relativeTop = 64 / _kBoardSize.height
    ..relativeWidth = 72 / _kBoardSize.width
    ..relativeHeight = 36 / _kBoardSize.height
    ..position = 23
    ..pocketDepth = 15.5
    ..holdType = HoldType.roundedPocket
    ..maxAllowedFingers = 5),
];

final beastmaker1000 = Board((b) => b
  ..manufacturer = 'Beastmaker'
  ..model = '1000'
  ..width = _kBoardSize.width
  ..height = _kBoardSize.height
  ..assetSrc = 'assets/images/boards/beastmaker_1000.png'
  ..handToBoardHeightRatio = 1.2
  ..aspectRatio = _kBoardSize.aspectRatio
  ..boardHolds.addAll(boardHolds)
  ..defaultLeftGripHold = boardHolds
      .singleWhere((boardHold) => boardHold.position == 11)
      .toBuilder()
  ..defaultRightGripHold = boardHolds
      .singleWhere((boardHold) => boardHold.position == 17)
      .toBuilder());
