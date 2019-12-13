import 'package:flutter/cupertino.dart';

import 'package:app/models/board.dart';

const Size _kBoardSize = Size(395.88, 100);

final beastmaker1000 = Board(
    manufacturer: 'Beastmaker',
    model: '1000',
    size: _kBoardSize,
    assetSrc: 'assets/images/boards/beastmaker_1000.png',
    handToBoardHeightRatio: 1.2,
    boardHolds: [
      BoardHold(
          rect: Rect.fromLTWH(0, 0, 83, 15),
          holdType: HoldType.jug,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          sloperDegrees: 35,
          rect: Rect.fromLTWH(83, 0, 64, 19),
          holdType: HoldType.sloper,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          sloperDegrees: 20,
          rect: Rect.fromLTWH(147, 0, 103, 15),
          holdType: HoldType.sloper,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          sloperDegrees: 35,
          rect: Rect.fromLTWH(250, 0, 64, 19),
          holdType: HoldType.sloper,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          rect: Rect.fromLTWH(313, 0, 83, 15),
          holdType: HoldType.jug,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 12,
          minPocketDepth: 10,
          rect: Rect.fromLTWH(0, 15, 83, 22),
          holdType: HoldType.pocket,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          pocketDepth: 30,
          rect: Rect.fromLTWH(147, 15, 50, 22),
          holdType: HoldType.pocket,
          maxAllowedFingers: 3,
          boardSize: _kBoardSize),
      BoardHold(
          pocketDepth: 30,
          rect: Rect.fromLTWH(197, 15, 53, 22),
          holdType: HoldType.pocket,
          maxAllowedFingers: 3,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 12,
          minPocketDepth: 10,
          rect: Rect.fromLTWH(314, 15, 82, 22),
          holdType: HoldType.pocket,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 43,
          minPocketDepth: 40,
          rect: Rect.fromLTWH(0, 37, 72, 27),
          holdType: HoldType.pocket,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 48,
          minPocketDepth: 45,
          rect: Rect.fromLTWH(72, 37, 40, 27),
          holdType: HoldType.pocket,
          maxAllowedFingers: 2,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 43,
          minPocketDepth: 40,
          rect: Rect.fromLTWH(112, 37, 50, 27),
          holdType: HoldType.pocket,
          maxAllowedFingers: 3,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 50,
          minPocketDepth: 46,
          rect: Rect.fromLTWH(162, 37, 72, 27),
          holdType: HoldType.pocket,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 43,
          minPocketDepth: 40,
          rect: Rect.fromLTWH(234, 37, 52, 27),
          holdType: HoldType.pocket,
          maxAllowedFingers: 3,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 48,
          minPocketDepth: 45,
          rect: Rect.fromLTWH(286, 37, 39, 27),
          holdType: HoldType.pocket,
          maxAllowedFingers: 2,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 43,
          minPocketDepth: 40,
          rect: Rect.fromLTWH(325, 37, 71, 27),
          holdType: HoldType.pocket,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 16,
          minPocketDepth: 15,
          rect: Rect.fromLTWH(35, 64, 72, 36),
          holdType: HoldType.pocket,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 22,
          minPocketDepth: 19,
          rect: Rect.fromLTWH(107, 64, 40, 36),
          holdType: HoldType.pocket,
          maxAllowedFingers: 2,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 17,
          minPocketDepth: 14,
          rect: Rect.fromLTWH(147, 64, 50, 36),
          holdType: HoldType.pocket,
          maxAllowedFingers: 3,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 17,
          minPocketDepth: 14,
          rect: Rect.fromLTWH(197, 64, 53, 36),
          holdType: HoldType.pocket,
          maxAllowedFingers: 3,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 22,
          minPocketDepth: 19,
          rect: Rect.fromLTWH(250, 64, 39, 36),
          holdType: HoldType.pocket,
          maxAllowedFingers: 2,
          boardSize: _kBoardSize),
      BoardHold(
          maxPocketDepth: 16,
          minPocketDepth: 15,
          rect: Rect.fromLTWH(289, 64, 72, 36),
          holdType: HoldType.pocket,
          maxAllowedFingers: 5,
          boardSize: _kBoardSize),
    ]);
