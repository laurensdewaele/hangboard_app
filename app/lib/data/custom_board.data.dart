import 'package:app/models/models.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

const int kRows = 4;
const int kColumns = 4;
const double kAspectRatio = 3;
const String kImageAsset = 'assets/images/custom_board/custom_board.png';
const double kHandToBoardHeightRatio = .85;
const double kSelectionBoxAspectRatio = 3.6;
const double kHorizontalSpacingPercent = _kSpacing / _measuredWidth;
const double kVerticalSpacingPercent = _kSpacing / _measuredHeight;

const double _kSpacing = styles.Measurements.xs;
const double _measuredWidth = 647;
const double _measuredHeight = _measuredWidth / kAspectRatio;

const double _widthPercent1 = (1 - (kHorizontalSpacingPercent * 5)) / kColumns;
const double _widthPercent2 = _widthPercent1 * 2 + kHorizontalSpacingPercent;
const double _widthPercent3 =
    _widthPercent1 * 3 + (kHorizontalSpacingPercent * 2);
const double _widthPercent4 =
    _widthPercent1 * 4 + (kHorizontalSpacingPercent * 3);

const double _leftPercentColumn1 = kHorizontalSpacingPercent;
const double _leftPercentColumn2 =
    _widthPercent1 + kHorizontalSpacingPercent * 2;
const double _leftPercentColumn3 =
    _widthPercent2 + kHorizontalSpacingPercent * 2;
const double _leftPercentColumn4 =
    _widthPercent3 + kHorizontalSpacingPercent * 2;

const double _bottomRowsTopPercent = (kVerticalSpacingPercent) +
    ((_widthPercent1 * _measuredWidth / kSelectionBoxAspectRatio) /
        _measuredHeight);

const double _pinchBlockJugScale = 1.08;
// This is the raw pinchBlock image height and the raw custom board image height.
const double _pinchBlockJugHeightPercent = 267 / 850;
const double _pinchBlockJugTopPercent =
    _bottomRowsTopPercent - _pinchBlockJugHeightPercent;
const double _sloperHeightPercent = _bottomRowsTopPercent;

const double _bottomRowsHeightPercent = (1 - _bottomRowsTopPercent);
const double _bottomRowsRowHeightPercent = _bottomRowsHeightPercent / 3;
const double _bottomRowsRowCenterHeightPercent =
    _bottomRowsRowHeightPercent / 2;
const double _topPercentRow2 =
    _bottomRowsTopPercent + _bottomRowsRowCenterHeightPercent;
const double _topPercentRow3 = _topPercentRow2 + _bottomRowsRowHeightPercent;
const double _topPercentRow4 = _topPercentRow3 + _bottomRowsRowHeightPercent;

const double _edgeHeightPercent = 60 / 850;
const double _edgeScale = 1.16;

const double _pocketHeightPercent = 112 / 850;
const double _pocketEdgeDifference =
    (_pocketHeightPercent - (_edgeHeightPercent * _edgeScale));

const Map<int, double> _widthPercents = {
  1: _widthPercent1,
  2: _widthPercent2,
  3: _widthPercent3,
  4: _widthPercent4
};

const Map<int, double> _widthPercentPocketFingers = {
  5: _widthPercent1,
  4: _widthPercent1 / 5 * 4,
  3: _widthPercent1 / 5 * 3,
  2: _widthPercent1 / 5 * 2,
  1: _widthPercent1 / 5 * 1
};

const Map<int, double> _leftPercents = {
  1: _leftPercentColumn1,
  2: _leftPercentColumn2,
  3: _leftPercentColumn3,
  4: _leftPercentColumn4
};

const Map<int, double> _topPercents = {
  2: _topPercentRow2,
  3: _topPercentRow3,
  4: _topPercentRow4
};

const double _onePixelHeightPercent = 0.005;
const double _onePixelWidthPercent = 0.002;

Rect getGestureDetectorRect({CustomBoardHoldImage image, Size boardSize}) {
  Rect _rect;

  if (image.holdType == HoldType.pinchBlock || image.holdType == HoldType.jug) {
    _rect = Rect.fromLTWH(
        image.leftPercent * boardSize.width,
        (image.topPercent - .02) * boardSize.height,
        image.widthPercent * boardSize.width,
        (image.heightPercent + .02) * boardSize.height);
  }

  if (image.holdType == HoldType.sloper) {
    _rect = image.getRect(
        boardHeight: boardSize.height, boardWidth: boardSize.width);
  }

  if (image.holdType == HoldType.edge) {
    _rect = Rect.fromLTWH(
        image.leftPercent * boardSize.width,
        (image.topPercent - .09) * boardSize.height,
        image.widthPercent * boardSize.width,
        (image.heightPercent + .13) * boardSize.height);
  }

  if (image.holdType == HoldType.pocket) {
    _rect = Rect.fromLTWH(
        image.leftPercent * boardSize.width,
        (image.topPercent - .04) * boardSize.height,
        image.widthPercent * boardSize.width,
        (image.heightPercent + .08) * boardSize.height);
  }

  return _rect;
}

class CustomBoardBuilder {
  CustomBoardBuilder() {
//    _board = Board((b) => b
//      ..id = Uuid().v4()
//      ..custom = true
//      ..model = ''
//      ..imageAsset = 'assets/images/custom_board/custom_board.png'
//      ..aspectRatio = 3
//      ..width = 2555
//      ..height = 850
//      ..handToBoardHeightRatio = 1.2
//      ..boardHolds = null
//      ..customBoardHoldImages = null
//      ..defaultLeftGripHold = null
//      ..defaultRightGripHold = null);
  }
  Board _board;
  List<CustomBoardHoldImage> _images = [];
  List<CustomBoardHoldImage> get images => _images;
  List<BoardHold> _boardHolds = [];
  List<BoardHold> get boardHolds => _boardHolds;

  void addBoardHoldAndImage({
    @required int row,
    @required int column,
    @required int widthFactor,
    @required HoldType type,
    double sloperDegrees,
    double depth,
    int supportedFingers,
  }) {
    switch (type) {
      case HoldType.pinchBlock:
        _images.add(CustomBoardHoldImage((b) => b
          ..holdType = HoldType.pinchBlock
          ..scale = _pinchBlockJugScale
          ..heightPercent = _pinchBlockJugHeightPercent
          ..widthPercent = _widthPercents[widthFactor]
          ..leftPercent = _leftPercents[column]
          ..topPercent = _pinchBlockJugTopPercent
          ..imageAsset =
              'assets/images/custom_board/pinch_block_$widthFactor.png'));
        List.generate(widthFactor, (i) {
          _boardHolds.add(BoardHold((b) => b
            ..holdType = HoldType.pinchBlock
            ..topPercent = _pinchBlockJugTopPercent - _onePixelHeightPercent * 2
            ..leftPercent = _leftPercents[column + i] - _onePixelWidthPercent
            ..widthPercent = _widthPercents[1] + _onePixelWidthPercent * 2
            ..heightPercent =
                _pinchBlockJugHeightPercent + _onePixelHeightPercent
            ..anchorLeftPercent =
                _leftPercents[column + i] + _widthPercents[1] / 2
            ..anchorTopPercent = _pinchBlockJugTopPercent));
        });
        break;
      case HoldType.jug:
        _images.add(CustomBoardHoldImage((b) => b
          ..holdType = HoldType.jug
          ..scale = _pinchBlockJugScale
          ..heightPercent = _pinchBlockJugHeightPercent
          ..widthPercent = _widthPercents[widthFactor]
          ..leftPercent = _leftPercents[column]
          ..topPercent = _pinchBlockJugTopPercent
          ..imageAsset = 'assets/images/custom_board/jug_$widthFactor.png'));
        List.generate(widthFactor, (i) {
          _boardHolds.add(BoardHold((b) => b
            ..holdType = HoldType.jug
            ..topPercent = _pinchBlockJugTopPercent - _onePixelHeightPercent * 2
            ..leftPercent = _leftPercents[column + i] - _onePixelWidthPercent
            ..widthPercent = _widthPercents[1] + _onePixelWidthPercent * 2
            ..heightPercent =
                _pinchBlockJugHeightPercent + _onePixelHeightPercent
            ..anchorLeftPercent =
                _leftPercents[column + i] + _widthPercents[1] / 2
            ..anchorTopPercent = _pinchBlockJugTopPercent));
        });
        break;
      case HoldType.sloper:
        _images.add(CustomBoardHoldImage((b) => b
          ..holdType = HoldType.sloper
          ..scale = 1
          ..heightPercent = _sloperHeightPercent
          ..widthPercent = _widthPercents[widthFactor]
          ..leftPercent = _leftPercents[column]
          ..topPercent = 0
          ..imageAsset = 'assets/images/custom_board/sloper_$widthFactor.png'));
        List.generate(widthFactor, (i) {
          _boardHolds.add(BoardHold((b) => b
            ..holdType = HoldType.sloper
            ..topPercent = 0 - _onePixelHeightPercent
            ..leftPercent = _leftPercents[column + i] - _onePixelWidthPercent
            ..widthPercent = _widthPercents[1] + _onePixelWidthPercent * 2
            ..heightPercent = _sloperHeightPercent + _onePixelHeightPercent * 2
            ..sloperDegrees = sloperDegrees
            ..anchorLeftPercent =
                _leftPercents[column + i] + _widthPercents[1] / 2
            ..anchorTopPercent = _sloperHeightPercent / 3));
        });
        break;
      case HoldType.pocket:
        _images.add(CustomBoardHoldImage((b) => b
          ..holdType = HoldType.pocket
          ..scale = 1
          ..heightPercent = _pocketHeightPercent
          ..widthPercent = widthFactor == 1
              ? _widthPercentPocketFingers[supportedFingers]
              : _widthPercents[widthFactor]
          ..leftPercent = widthFactor == 1
              ? _leftPercents[column] +
                  ((_widthPercent1 -
                          _widthPercentPocketFingers[supportedFingers]) /
                      2)
              : _leftPercents[column]
          ..topPercent = _topPercents[row] - _pocketEdgeDifference
          ..imageAsset = widthFactor == 1
              ? 'assets/images/custom_board/pocket_1_${supportedFingers}f.png'
              : 'assets/images/custom_board/pocket_$widthFactor.png'));
        List.generate(widthFactor, (i) {
          _boardHolds.add(BoardHold((b) => b
            ..holdType = HoldType.pocket
            ..topPercent = _topPercents[row] -
                _pocketEdgeDifference -
                _onePixelHeightPercent
            ..leftPercent = _leftPercents[column + i] - _onePixelWidthPercent
            ..widthPercent = _widthPercents[1] + _onePixelWidthPercent * 2
            ..heightPercent = _pocketHeightPercent + _onePixelHeightPercent * 2
            ..depth = depth
            ..supportedFingers = supportedFingers
            ..anchorLeftPercent =
                _leftPercents[column + i] + _widthPercents[1] / 2
            ..anchorTopPercent = _topPercents[row] -
                _pocketEdgeDifference +
                _pocketHeightPercent));
        });
        break;
      case HoldType.edge:
        _images.add(CustomBoardHoldImage((b) => b
          ..holdType = HoldType.edge
          ..scale = _edgeScale
          ..heightPercent = _edgeHeightPercent
          ..widthPercent = _widthPercents[widthFactor]
          ..leftPercent = _leftPercents[column]
          ..topPercent = _topPercents[row]
          ..imageAsset = 'assets/images/custom_board/edge_$widthFactor.png'));
        List.generate(widthFactor, (i) {
          _boardHolds.add(BoardHold((b) => b
            ..holdType = HoldType.edge
            ..topPercent = _topPercents[row] -
                _pocketEdgeDifference -
                _onePixelHeightPercent
            ..leftPercent = _leftPercents[column + i] - _onePixelWidthPercent
            ..widthPercent = _widthPercents[1] + _onePixelWidthPercent * 2
            ..heightPercent = _pocketHeightPercent + _onePixelHeightPercent * 2
            ..depth = depth
            ..anchorLeftPercent =
                _leftPercents[column + i] + _widthPercents[1] / 2
            ..anchorTopPercent = _topPercents[row]));
        });
        break;
    }
  }
}
