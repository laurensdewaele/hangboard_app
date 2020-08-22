import 'dart:ui';

import 'package:tenso_app/models/models.dart';

const Size _kBoardSize = const Size(1000, 385);

final List<BoardHold> _boardHolds = [
  BoardHold((b) => b
    ..anchorXPercent = 132 / _kBoardSize.width
    ..anchorYPercent = 4 / _kBoardSize.height
    ..leftPercent = 0 / _kBoardSize.width
    ..topPercent = -5 / _kBoardSize.height
    ..widthPercent = 248 / _kBoardSize.width
    ..heightPercent = 46 / _kBoardSize.height
    ..position = 1
    ..holdType = HoldType.jug
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 374 / _kBoardSize.width
    ..anchorYPercent = 4 / _kBoardSize.height
    ..leftPercent = 248 / _kBoardSize.width
    ..topPercent = -5 / _kBoardSize.height
    ..widthPercent = 252 / _kBoardSize.width
    ..heightPercent = 46 / _kBoardSize.height
    ..position = 2
    ..holdType = HoldType.sloper
    ..sloperDegrees = 60
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 626 / _kBoardSize.width
    ..anchorYPercent = 4 / _kBoardSize.height
    ..leftPercent = 500 / _kBoardSize.width
    ..topPercent = -5 / _kBoardSize.height
    ..widthPercent = 251 / _kBoardSize.width
    ..heightPercent = 46 / _kBoardSize.height
    ..position = 3
    ..holdType = HoldType.jug
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 877 / _kBoardSize.width
    ..anchorYPercent = 4 / _kBoardSize.height
    ..leftPercent = 751 / _kBoardSize.width
    ..topPercent = -5 / _kBoardSize.height
    ..widthPercent = 249 / _kBoardSize.width
    ..heightPercent = 46 / _kBoardSize.height
    ..position = 4
    ..holdType = HoldType.sloper
    ..sloperDegrees = 60
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 123 / _kBoardSize.width
    ..anchorYPercent = 103 / _kBoardSize.height
    ..leftPercent = 0 / _kBoardSize.width
    ..topPercent = 41 / _kBoardSize.height
    ..widthPercent = 248 / _kBoardSize.width
    ..heightPercent = 83 / _kBoardSize.height
    ..position = 5
    ..holdType = HoldType.pocket
    ..depth = 20
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 380 / _kBoardSize.width
    ..anchorYPercent = 103 / _kBoardSize.height
    ..leftPercent = 248 / _kBoardSize.width
    ..topPercent = 41 / _kBoardSize.height
    ..widthPercent = 252 / _kBoardSize.width
    ..heightPercent = 83 / _kBoardSize.height
    ..position = 6
    ..holdType = HoldType.pocket
    ..depth = 18
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 632 / _kBoardSize.width
    ..anchorYPercent = 103 / _kBoardSize.height
    ..leftPercent = 500 / _kBoardSize.width
    ..topPercent = 41 / _kBoardSize.height
    ..widthPercent = 251 / _kBoardSize.width
    ..heightPercent = 83 / _kBoardSize.height
    ..position = 7
    ..holdType = HoldType.pocket
    ..depth = 20
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 884 / _kBoardSize.width
    ..anchorYPercent = 103 / _kBoardSize.height
    ..leftPercent = 751 / _kBoardSize.width
    ..topPercent = 41 / _kBoardSize.height
    ..widthPercent = 249 / _kBoardSize.width
    ..heightPercent = 83 / _kBoardSize.height
    ..position = 8
    ..holdType = HoldType.pocket
    ..depth = 18
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 137 / _kBoardSize.width
    ..anchorYPercent = 171 / _kBoardSize.height
    ..leftPercent = 0 / _kBoardSize.width
    ..topPercent = 150 / _kBoardSize.height
    ..widthPercent = 253 / _kBoardSize.width
    ..heightPercent = 74 / _kBoardSize.height
    ..position = 9
    ..holdType = HoldType.edge
    ..depth = 16
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 380 / _kBoardSize.width
    ..anchorYPercent = 171 / _kBoardSize.height
    ..leftPercent = 253 / _kBoardSize.width
    ..topPercent = 150 / _kBoardSize.height
    ..widthPercent = 247 / _kBoardSize.width
    ..heightPercent = 74 / _kBoardSize.height
    ..position = 10
    ..holdType = HoldType.edge
    ..depth = 14
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 630 / _kBoardSize.width
    ..anchorYPercent = 171 / _kBoardSize.height
    ..leftPercent = 500 / _kBoardSize.width
    ..topPercent = 150 / _kBoardSize.height
    ..widthPercent = 245 / _kBoardSize.width
    ..heightPercent = 74 / _kBoardSize.height
    ..position = 11
    ..holdType = HoldType.edge
    ..depth = 16
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 866 / _kBoardSize.width
    ..anchorYPercent = 171 / _kBoardSize.height
    ..leftPercent = 745 / _kBoardSize.width
    ..topPercent = 150 / _kBoardSize.height
    ..widthPercent = 255 / _kBoardSize.width
    ..heightPercent = 74 / _kBoardSize.height
    ..position = 12
    ..holdType = HoldType.edge
    ..depth = 14
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 136 / _kBoardSize.width
    ..anchorYPercent = 258 / _kBoardSize.height
    ..leftPercent = 0 / _kBoardSize.width
    ..topPercent = 241 / _kBoardSize.height
    ..widthPercent = 253 / _kBoardSize.width
    ..heightPercent = 74 / _kBoardSize.height
    ..position = 13
    ..holdType = HoldType.edge
    ..depth = 12
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 381 / _kBoardSize.width
    ..anchorYPercent = 258 / _kBoardSize.height
    ..leftPercent = 253 / _kBoardSize.width
    ..topPercent = 241 / _kBoardSize.height
    ..widthPercent = 247 / _kBoardSize.width
    ..heightPercent = 74 / _kBoardSize.height
    ..position = 14
    ..holdType = HoldType.edge
    ..depth = 10
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 626 / _kBoardSize.width
    ..anchorYPercent = 258 / _kBoardSize.height
    ..leftPercent = 500 / _kBoardSize.width
    ..topPercent = 241 / _kBoardSize.height
    ..widthPercent = 240 / _kBoardSize.width
    ..heightPercent = 74 / _kBoardSize.height
    ..position = 15
    ..holdType = HoldType.edge
    ..depth = 12
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 861 / _kBoardSize.width
    ..anchorYPercent = 258 / _kBoardSize.height
    ..leftPercent = 740 / _kBoardSize.width
    ..topPercent = 241 / _kBoardSize.height
    ..widthPercent = 260 / _kBoardSize.width
    ..heightPercent = 74 / _kBoardSize.height
    ..position = 16
    ..holdType = HoldType.edge
    ..depth = 10
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 140 / _kBoardSize.width
    ..anchorYPercent = 341 / _kBoardSize.height
    ..leftPercent = 0 / _kBoardSize.width
    ..topPercent = 333 / _kBoardSize.height
    ..widthPercent = 256 / _kBoardSize.width
    ..heightPercent = 55 / _kBoardSize.height
    ..position = 17
    ..holdType = HoldType.edge
    ..depth = 8
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 382 / _kBoardSize.width
    ..anchorYPercent = 341 / _kBoardSize.height
    ..leftPercent = 256 / _kBoardSize.width
    ..topPercent = 333 / _kBoardSize.height
    ..widthPercent = 244 / _kBoardSize.width
    ..heightPercent = 55 / _kBoardSize.height
    ..position = 18
    ..holdType = HoldType.edge
    ..depth = 7
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 625 / _kBoardSize.width
    ..anchorYPercent = 341 / _kBoardSize.height
    ..leftPercent = 500 / _kBoardSize.width
    ..topPercent = 333 / _kBoardSize.height
    ..widthPercent = 240 / _kBoardSize.width
    ..heightPercent = 55 / _kBoardSize.height
    ..position = 19
    ..holdType = HoldType.edge
    ..depth = 8
    ..supportedFingers = 5),
  BoardHold((b) => b
    ..anchorXPercent = 865 / _kBoardSize.width
    ..anchorYPercent = 341 / _kBoardSize.height
    ..leftPercent = 740 / _kBoardSize.width
    ..topPercent = 333 / _kBoardSize.height
    ..widthPercent = 260 / _kBoardSize.width
    ..heightPercent = 55 / _kBoardSize.height
    ..position = 20
    ..holdType = HoldType.edge
    ..depth = 7
    ..supportedFingers = 5),
];

final awesomeWoodysTheHomeBoy = Board((b) => b
  ..name = 'Awesome Woodys - The home boy'
  ..id = 'awesome_woodys_the_home_boy'
  ..manufacturer = 'Awesome Woodys'
  ..model = 'The Home boy'
  ..imageAssetWidth = _kBoardSize.width
  ..imageAssetHeight = _kBoardSize.height
  ..imageAsset = 'assets/images/boards/awesome_woodys_the_home_boy.png'
  ..handToBoardHeightRatio = .937
  ..boardHolds.addAll(_boardHolds)
  ..defaultLeftGripHold = _boardHolds
      .singleWhere((boardHold) => boardHold.position == 5)
      .toBuilder()
  ..defaultRightGripHold = _boardHolds
      .singleWhere((boardHold) => boardHold.position == 7)
      .toBuilder());
