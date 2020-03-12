import 'package:flutter/cupertino.dart';

import 'package:app/models/board.dart';
import 'package:app/models/board_hold.dart';
import 'package:app/models/grip.dart';
import 'package:app/models/hand_type.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/widgets/countdown/board.dart';
import 'package:app/widgets/grip_image.dart';

class BoardWithGrips extends StatefulWidget {
  BoardWithGrips(
      {Key key,
      @required this.board,
      @required this.leftGripBoardHold,
      @required this.rightGripBoardHold,
      @required this.leftGrip,
      @required this.rightGrip,
      @required this.reportTotalHeight,
      @required this.orientation})
      : super(key: key);

  final Orientation orientation;
  final Board board;
  final BoardHold leftGripBoardHold;
  final BoardHold rightGripBoardHold;
  final Grip leftGrip;
  final Grip rightGrip;
  final Function(double h) reportTotalHeight;

  @override
  _BoardWithGripsState createState() => _BoardWithGripsState();
}

class _BoardWithGripsState extends State<BoardWithGrips> {
  Size _boardSize;
  double _gripHeight;
  Offset _leftHandOffset;
  Offset _rightHandOffset;

  @override
  void didUpdateWidget(Widget oldWidget) {
    if (widget.leftGrip != null && widget.leftGripBoardHold != null) {
      _setHandOffset(widget.leftGrip, widget.leftGripBoardHold);
    }

    if (widget.rightGrip != null && widget.rightGripBoardHold != null) {
      _setHandOffset(widget.rightGrip, widget.rightGripBoardHold);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _handleBoardDimensions(Size boardSize) {
    final gripHeight = boardSize.height * widget.board.handToBoardHeightRatio;
    final totalHeight = boardSize.height + gripHeight;
    widget.reportTotalHeight(totalHeight);

    setState(() {
      _boardSize = boardSize;
      _gripHeight = gripHeight;
    });

    if (widget.leftGrip != null && widget.leftGripBoardHold != null) {
      _setHandOffset(widget.leftGrip, widget.leftGripBoardHold);
    }
    if (widget.rightGrip != null && widget.rightGripBoardHold != null) {
      _setHandOffset(widget.rightGrip, widget.rightGripBoardHold);
    }
  }

  _setHandOffset(Grip grip, BoardHold boardHold) {
    final double gripDYHangAnchor = grip.dyRelativeHangAnchor * _gripHeight;
    final double gripDXHangAnchor =
        grip.dxRelativeHangAnchor * grip.assetAspectRatio * _gripHeight;
    final double holdDYHangAnchor =
        boardHold.dyRelativeHangAnchor * _boardSize.height;
    final double holdDXHangAnchor =
        boardHold.dxRelativeHangAnchor * _boardSize.width;
    final Offset offset = Offset(holdDXHangAnchor - gripDXHangAnchor,
        holdDYHangAnchor - gripDYHangAnchor);

    if (grip.handType == HandType.leftHand) {
      setState(() {
        _leftHandOffset = offset;
      });
    } else {
      setState(() {
        _rightHandOffset = offset;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            HangBoard(
              boardAspectRatio: widget.board.aspectRatio,
              boardAssetSrc: widget.board.assetSrc,
              handleBoardDimensions: _handleBoardDimensions,
              setHandOffset: _setHandOffset,
              orientation: widget.orientation,
            ),
            if (widget.leftGrip != null && _leftHandOffset != null)
              Positioned(
                left: _leftHandOffset.dx,
                top: _leftHandOffset.dy,
                child: Container(
                  height: _gripHeight,
                  child: GripImage(
                    assetSrc: widget.leftGrip.assetSrc,
                    selected: false,
                    color: styles.Colors.lighestGray,
                  ),
                ),
              ),
            if (widget.rightGrip != null && _rightHandOffset != null)
              Positioned(
                left: _rightHandOffset.dx,
                top: _rightHandOffset.dy,
                child: Container(
                  height: _gripHeight,
                  child: GripImage(
                    assetSrc: widget.rightGrip.assetSrc,
                    selected: false,
                    color: styles.Colors.lighestGray,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}