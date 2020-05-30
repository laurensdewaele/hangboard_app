import 'package:app/models/models.dart';
import 'package:app/services/error.service.dart';
import 'package:app/services/toast.service.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/view_models/execution/execution.vm.dart';
import 'package:app/view_models/execution/execution_state.vm.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/dialog.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/execution/edit_hangs_dialog.dart';
import 'package:app/widgets/execution/execution_landscape.dart';
import 'package:app/widgets/execution/execution_portrait.dart';
import 'package:app/widgets/icons.dart' as icons;
import 'package:app/widgets/toast_provider.dart';
import 'package:flutter/cupertino.dart' hide Icon;

class ExecutionScreenArguments {
  ExecutionScreenArguments({this.workout});

  final Workout workout;
}

class ExecutionScreen extends StatefulWidget {
  ExecutionScreen({Key key}) : super(key: key);

  @override
  _ExecutionScreenState createState() => _ExecutionScreenState();
}

class _ExecutionScreenState extends State<ExecutionScreen>
    with SingleTickerProviderStateMixin {
  ExecutionViewModel _viewModel;
  AnimationController _animationController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_viewModel == null) {
      final ExecutionScreenArguments routeArguments =
          ModalRoute.of(context).settings.arguments;
      _animationController = AnimationController(vsync: this);
      _viewModel = ExecutionViewModel(
          workout: routeArguments.workout,
          animationController: _animationController);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _pause() {
    _viewModel.handlePauseTap();
    showAppDialog(
        smallWidth: true,
        context: context,
        content: _PauseDialog(
            duringHang: _viewModel.state.type == ExecutionEventType.hangTimer,
            handleEditHangsTap: _handleEditHangsTap,
            handleResumeTap: _viewModel.handleResumeTap,
            handleSkipTap: _viewModel.handleSkipTap,
            handleStopTap: _viewModel.handleStopTap));
  }

  void _handleEditHangsTap() async {
    if (_viewModel.state.type == ExecutionEventType.hangTimer) {
      ToastService().add(ErrorMessages.editOnlyPossibleOnRests());
    } else {
      _viewModel.handleEditHangsTap();
      await showAppDialog(
          fullWidth: true,
          context: context,
          content: EditHangsDialog(
            hangs: _viewModel.hangs,
            handleEditedHangs: _viewModel.handleEditedHangs,
          ),
          smallWidth: false);
    }
  }

  void _onHorizontalDragEnd(DragEndDetails detail) {
    _pause();
  }

  @override
  Widget build(BuildContext context) {
    final Orientation _orientation = MediaQuery.of(context).orientation;

    return WillPopScope(
      onWillPop: () async {
        _pause();
        return false;
      },
      child: ToastProvider(
        child: StreamBuilder<ExecutionViewModelState>(
            initialData: _viewModel.state,
            stream: _viewModel.state$,
            builder: (context, snapshot) {
              final _state = snapshot.data;
              return GestureDetector(
                onTap: _pause,
                onHorizontalDragEnd: _onHorizontalDragEnd,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: styles.Colors.bgBlack),
                  ),
                  FractionallySizedBox(
                      heightFactor: _state.animatedBackgroundHeightFactor,
                      child: Container(
                        decoration: BoxDecoration(color: _state.primaryColor),
                      )),
                  SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(styles.Measurements.m),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            if (_orientation == Orientation.portrait) {
                              return ExecutionPortrait(
                                handleReadyTap: _viewModel.handleReadyTap,
                                isStopwatch: _state.isStopwatch,
                                title: _state.title,
                                weightSystem: _state.weightSystem,
                                seconds: _state.seconds,
                                rightGripBoardHold: _state.rightGripBoardHold,
                                rightGrip: _state.rightGrip,
                                leftGripBoardHold: _state.leftGripBoardHold,
                                leftGrip: _state.leftGrip,
                                board: _state.board,
                                currentHangPerSet: _state.currentHangPerSet,
                                currentSet: _state.currentSet,
                                holdLabel: _state.holdLabel,
                                primaryColor: _state.primaryColor,
                                totalHangsPerSet: _state.totalHangsPerSet,
                                totalSets: _state.totalSets,
                                addedWeight: _state.addedWeight,
                              );
                            } else {
                              return ExecutionLandscape(
                                seconds: _state.seconds,
                                handleReadyTap: _viewModel.handleReadyTap,
                                isStopwatch: _state.isStopwatch,
                                title: _state.title,
                                weightSystem: _state.weightSystem,
                                rightGripBoardHold: _state.rightGripBoardHold,
                                rightGrip: _state.rightGrip,
                                leftGripBoardHold: _state.leftGripBoardHold,
                                leftGrip: _state.leftGrip,
                                board: _state.board,
                                currentHangPerSet: _state.currentHangPerSet,
                                currentSet: _state.currentSet,
                                holdLabel: _state.holdLabel,
                                primaryColor: _state.primaryColor,
                                totalHangsPerSet: _state.totalHangsPerSet,
                                totalSets: _state.totalSets,
                                addedWeight: _state.addedWeight,
                              );
                            }
                          },
                        )),
                  ),
                ]),
              );
            }),
      ),
    );
  }
}

class _PauseDialog extends StatelessWidget {
  _PauseDialog({
    Key key,
    @required this.handleResumeTap,
    @required this.handleSkipTap,
    @required this.handleStopTap,
    @required this.handleEditHangsTap,
    @required this.duringHang,
  }) : super(key: key);

  final bool duringHang;
  final VoidCallback handleStopTap;
  final VoidCallback handleResumeTap;
  final VoidCallback handleSkipTap;
  final VoidCallback handleEditHangsTap;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        handleResumeTap();
        return false;
      },
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'paused',
                style: styles.Staatliches.xlBlack,
              ),
              Divider(
                height: styles.Measurements.xs,
              ),
              Text(
                'Progress will be saved when skipping or stopping.',
                textAlign: TextAlign.center,
                style: styles.Lato.xsBlack,
              ),
              Divider(
                height: styles.Measurements.xxl,
              ),
              Button(
                smallText: true,
                text: 'edit hangs',
                handleTap: handleEditHangsTap,
                displayBackground: true,
                backgroundColor: styles.Colors.blue,
                leadingIcon: icons.editIconWhiteL,
                leadingIconTextCentered: true,
              ),
              Divider(
                height: styles.Measurements.m,
              ),
              Button(
                smallText: true,
                text: duringHang ? 'end hang' : 'skip next hang',
                handleTap: handleSkipTap,
                displayBackground: true,
                backgroundColor: styles.Colors.gray,
                leadingIcon: icons.skipIconWhiteL,
                leadingIconTextCentered: true,
              ),
              Divider(
                height: styles.Measurements.m,
              ),
              Button(
                smallText: true,
                text: 'stop',
                handleTap: handleStopTap,
                displayBackground: true,
                backgroundColor: styles.Colors.primary,
                leadingIcon: icons.stopIconWhiteL,
                leadingIconTextCentered: true,
              ),
              Divider(
                height: styles.Measurements.l,
              ),
              Button(
                smallText: true,
                text: 'resume',
                handleTap: handleResumeTap,
                displayBackground: false,
                leadingIcon: icons.playIconBlackL,
                leadingIconTextCentered: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
