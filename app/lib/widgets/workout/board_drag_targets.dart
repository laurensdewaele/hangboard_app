import 'package:app/models/models.dart';
import 'package:app/services/error.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/widgets/board.dart';
import 'package:flutter/cupertino.dart';

class BoardDragTargets extends StatefulWidget {
  BoardDragTargets(
      {Key key,
      @required this.handleBoardDimensions,
      @required this.setHandOffset,
      @required this.orientation,
      @required this.setErrorMessage,
      @required this.boardAspectRatio,
      @required this.boardImageAsset,
      @required this.boardHolds,
      @required this.activeBoardHolds,
      @required this.customBoardHoldImages})
      : super(key: key);

  final List<CustomBoardHoldImage> customBoardHoldImages;
  final List<BoardHold> activeBoardHolds;
  final double boardAspectRatio;
  final String boardImageAsset;
  final List<BoardHold> boardHolds;
  final void Function(Size boardSize) handleBoardDimensions;
  final void Function(Grip grip, BoardHold boardHold) setHandOffset;
  final Orientation orientation;
  final void Function(Widget errorMessage) setErrorMessage;

  @override
  _BoardDragTargetsState createState() => _BoardDragTargetsState();
}

class _BoardDragTargetsState extends State<BoardDragTargets> {
  bool _shouldCheckDimensions = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(BoardDragTargets oldWidget) {
    if (oldWidget.orientation != widget.orientation) {
      setState(() {
        _shouldCheckDimensions = true;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void _triggerPostFrameCallback(Size boardSize) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.handleBoardDimensions(boardSize);
      setState(() {
        _shouldCheckDimensions = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final Size _boardSize = Size(
          constraints.maxWidth, constraints.maxWidth / widget.boardAspectRatio);

      if (_shouldCheckDimensions == true) {
        _triggerPostFrameCallback(_boardSize);
      }
      return Stack(
        children: <Widget>[
          HangBoard(
            boardSize: _boardSize,
            customBoardHoldImages: widget.customBoardHoldImages,
            boardImageAsset: widget.boardImageAsset,
          ),
          ...widget.boardHolds.map((BoardHold boardHold) {
            final Rect rect = boardHold.getRect(
                boardHeight: _boardSize.height, boardWidth: _boardSize.width);
            return Positioned.fromRect(
                rect: rect,
                child: DragTarget(
                  builder: (BuildContext context, List<Grip> candidateData,
                      List<dynamic> rejectedData) {
                    if (candidateData.length > 0) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: styles.kBorderRadiusAll,
                            border: Border.all(
                                width: 2, color: styles.Colors.green)),
                      );
                    }
                    if (rejectedData.length > 0) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: styles.kBorderRadiusAll,
                            border: Border.all(
                                width: 2, color: styles.Colors.primary)),
                      );
                    }
                    return Container();
                  },
                  onWillAccept: (Grip grip) {
                    if (widget.activeBoardHolds.contains(boardHold)) {
                      widget.setErrorMessage(ErrorMessages.holdAlreadyTaken());
                      return false;
                    }

                    if (boardHold.checkGripCompatibility(grip) == true) {
                      return true;
                    } else {
                      widget.setErrorMessage(
                          ErrorMessages.exceedsSupportedFingers(
                              max: boardHold.supportedFingers));
                      return false;
                    }
                  },
                  onAccept: (data) {
                    widget.setErrorMessage(null);
                    widget.setHandOffset(data, boardHold);
                  },
                  onLeave: (data) {},
                ));
          }),
        ],
      );
    });
  }
}
