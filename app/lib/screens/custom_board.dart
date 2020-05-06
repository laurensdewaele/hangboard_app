import 'package:app/data/custom_board_hold_images.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/view_models/custom_board/custom_board.dart';
import 'package:app/widgets/bottom_menu_drawer.dart';
import 'package:app/widgets/custom_board/add_hold_modal.dart';
import 'package:app/widgets/custom_board/hold_input_modal.dart';
import 'package:app/widgets/icons.dart' as icons;
import 'package:app/widgets/keyboard_and_toast_provider.dart';
import 'package:app/widgets/modal_popup.dart';
import 'package:app/widgets/screen.dart';
import 'package:app/widgets/top_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CustomBoardScreen extends StatefulWidget {
  CustomBoardScreen({Key key}) : super(key: key);

  @override
  _CustomBoardScreenState createState() => _CustomBoardScreenState();
}

class _CustomBoardScreenState extends State<CustomBoardScreen> {
  CustomBoardViewModel _viewModel;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _viewModel = CustomBoardViewModel();
    _viewModel.addListener(_viewModelListener);
    super.initState();
  }

  void _viewModelListener() {
    setState(() {});
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _viewModel.removeListener(_viewModelListener);
    super.dispose();
  }

  void _handleSaveTap() {}
  void _handlePreviewTap() {}
  void _handleInfoTap() {}
  void _handleAddHoldTap() async {
    await showAppModalPopup(
        context: context,
        content: HoldInputModal(
          customBoardViewModel: _viewModel,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardAndToastProvider(
      child: Stack(
        children: <Widget>[
          Screen(
            gradientStartColor: styles.Colors.bgGrayStart,
            gradientStopColor: styles.Colors.bgGrayStop,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TopNavigation(
                  title: 'custom board',
                  dark: true,
                  handleBackNavigation: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  styles.Measurements.xs, 64, styles.Measurements.xs, 45),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final _customBoardWidth = constraints.maxWidth;
                  final _customBoardHeight =
                      _customBoardWidth / kCustomBoardAspectRatio;
                  final _customBoardY0 =
                      (constraints.maxHeight - _customBoardHeight) / 2;
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                            borderRadius: styles.kBorderRadiusAll,
                            child: Image.asset(
                                'assets/images/custom_board/custom_board.png')),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: AspectRatio(
                          aspectRatio: kCustomBoardAspectRatio,
                          child: GridView.count(
                            padding: EdgeInsets.all(styles.Measurements.xs),
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            crossAxisSpacing: kCustomBoardSpacing,
                            mainAxisSpacing: kCustomBoardSpacing,
                            childAspectRatio: kSelectionBoxAspectRatio,
                            crossAxisCount: kCustomBoardColumns,
                            children: <Widget>[
                              ..._viewModel.boxes.map((BoxState boxState) =>
                                  boxState.selected == true
                                      ? _SelectedBox(
                                          handleTap: () =>
                                              _viewModel.handleBoxTap(boxState))
                                      : _Box(
                                          handleTap: () =>
                                              _viewModel.handleBoxTap(boxState),
                                        ))
                            ],
                          ),
                        ),
                      ),
                      Positioned.fromRect(
                          child: Transform.scale(
                            scale: jug1.scale,
                            child: Image.asset(
                              jug1.imageAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                          rect: Rect.fromLTWH(
                              jug1.leftXPercent[0] * _customBoardWidth,
                              _customBoardY0 +
                                  jug1.topYPercent[0] * _customBoardHeight,
                              jug1.widthPercent * _customBoardWidth,
                              jug1.heightPercent * _customBoardHeight)),
                      Positioned.fromRect(
                          child: Transform.scale(
                            scale: pinchBlock1.scale,
                            child: Image.asset(
                              pinchBlock1.imageAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                          rect: Rect.fromLTWH(
                              jug1.leftXPercent[1] * _customBoardWidth,
                              _customBoardY0 +
                                  pinchBlock1.topYPercent[0] *
                                      _customBoardHeight,
                              pinchBlock1.widthPercent * _customBoardWidth,
                              pinchBlock1.heightPercent * _customBoardHeight)),
                      Positioned.fromRect(
                          child: Transform.scale(
                            scale: sloper2.scale,
                            child: Image.asset(
                              sloper2.imageAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                          rect: Rect.fromLTWH(
                              jug1.leftXPercent[2] * _customBoardWidth,
                              _customBoardY0 +
                                  sloper2.topYPercent[0] * _customBoardHeight,
                              sloper2.widthPercent * _customBoardWidth,
                              sloper2.heightPercent * _customBoardHeight)),
                      Positioned.fromRect(
                          child: Transform.scale(
                            scale: edge4.scale,
                            child: Image.asset(
                              edge4.imageAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                          rect: Rect.fromLTWH(
                              edge4.leftXPercent[0] * _customBoardWidth,
                              _customBoardY0 +
                                  edge4.topYPercent[1] * _customBoardHeight,
                              edge4.widthPercent * _customBoardWidth,
                              edge4.heightPercent * _customBoardHeight)),
                      Positioned.fromRect(
                          child: Transform.scale(
                            scale: edge4.scale,
                            child: Image.asset(
                              edge4.imageAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                          rect: Rect.fromLTWH(
                              edge4.leftXPercent[0] * _customBoardWidth,
                              _customBoardY0 +
                                  edge4.topYPercent[2] * _customBoardHeight,
                              edge4.widthPercent * _customBoardWidth,
                              edge4.heightPercent * _customBoardHeight)),
                      Positioned.fromRect(
                          child: Transform.scale(
                            scale: edge2.scale,
                            child: Image.asset(
                              edge2.imageAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                          rect: Rect.fromLTWH(
                              edge2.leftXPercent[0] * _customBoardWidth,
                              _customBoardY0 +
                                  edge2.topYPercent[3] * _customBoardHeight,
                              edge2.widthPercent * _customBoardWidth,
                              edge2.heightPercent * _customBoardHeight)),
                      Positioned.fromRect(
                          child: Transform.scale(
                            scale: pocket2.scale,
                            child: Image.asset(
                              pocket2.imageAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                          rect: Rect.fromLTWH(
                              pocket2.leftXPercent[2] * _customBoardWidth,
                              pocket2.topYPercent[3] * _customBoardHeight,
                              pocket2.widthPercent * _customBoardWidth,
                              pocket2.heightPercent * _customBoardHeight)),
                    ],
                  );
                },
              ),
            ),
          ),
          BottomMenuDrawer(
            dragIndicatorColor: styles.Colors.lightGray,
            menuItems: [
              MenuItem(
                name: 'save',
                handleTap: _handleSaveTap,
              ),
              MenuItem(
                name: 'preview',
                handleTap: _handlePreviewTap,
              ),
              MenuItem(
                name: 'info',
                handleTap: _handleInfoTap,
              )
            ],
            longestMenuItemLength: 120,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: AddHoldModal(
                open: _viewModel.addHoldModalOpen,
                handleTap: _handleAddHoldTap,
              ))
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  _Box({Key key, @required this.handleTap}) : super(key: key);

  final VoidCallback handleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: styles.kBorderRadiusAll,
            border:
                Border.all(width: 1, color: styles.Colors.whiteTranslucent)),
        child: Center(
          child: icons.plusIconWhiteS,
        ),
      ),
    );
  }
}

class _SelectedBox extends StatelessWidget {
  _SelectedBox({Key key, @required this.handleTap}) : super(key: key);

  final VoidCallback handleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: styles.kBorderRadiusAll,
            border: Border.all(width: 1, color: styles.Colors.black)),
        child: Center(
          child: icons.selectedIconBlackS,
        ),
      ),
    );
  }
}
