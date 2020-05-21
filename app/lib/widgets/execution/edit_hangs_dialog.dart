import 'package:app/models/models.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/view_models/execution/edit_hangs_dialog.vm.dart';
import 'package:app/widgets/board/board_with_grips.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/number_input_and_description.dart';
import 'package:flutter/cupertino.dart';

class EditHangInfo {
  final int duration;
  final Board board;
  final Grip leftGrip;
  final Grip rightGrip;
  final BoardHold leftGripBoardHold;
  final BoardHold rightGripBoardHold;
  final int currentHang;
  final WeightUnit weightUnit;
  final double addedWeight;

  const EditHangInfo({
    @required this.duration,
    @required this.board,
    @required this.leftGrip,
    @required this.rightGrip,
    @required this.leftGripBoardHold,
    @required this.rightGripBoardHold,
    @required this.currentHang,
    @required this.weightUnit,
    @required this.addedWeight,
  });
}

class EditHangsDialog extends StatefulWidget {
  EditHangsDialog(
      {Key key,
      @required this.editHangInfoList,
      @required this.currentHang,
      @required this.totalHangs})
      : super(key: key);

  final List<EditHangInfo> editHangInfoList;
  final int currentHang;
  final int totalHangs;

  @override
  _EditHangsDialogState createState() => _EditHangsDialogState();
}

class _EditHangsDialogState extends State<EditHangsDialog> {
  EditHangsDialogViewModel _viewModel;

  @override
  void initState() {
    _viewModel = EditHangsDialogViewModel(
        editHangInfoList: widget.editHangInfoList,
        currentHang: widget.currentHang,
        totalHangs: widget.totalHangs);
    _viewModel.addListener(_viewModelListener);
    super.initState();
  }

  void _viewModelListener() {
    setState(() {});
  }

  @override
  void dispose() {
    _viewModel.removeListener(_viewModelListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BoardWithGrips(
                      boardImageAssetWidth:
                          _viewModel.selectedHangInfo.board.imageAssetWidth,
                      boardImageAsset:
                          _viewModel.selectedHangInfo.board.imageAsset,
                      customBoardHoldImages: _viewModel
                          .selectedHangInfo.board.customBoardHoldImages
                          ?.toList(),
                      withFixedHeight: true,
                      handToBoardHeightRatio: _viewModel
                          .selectedHangInfo.board.handToBoardHeightRatio,
                      boardAspectRatio:
                          _viewModel.selectedHangInfo.board.aspectRatio,
                      rightGripBoardHold:
                          _viewModel.selectedHangInfo.rightGripBoardHold,
                      leftGripBoardHold:
                          _viewModel.selectedHangInfo.leftGripBoardHold,
                      leftGrip: _viewModel.selectedHangInfo.leftGrip,
                      rightGrip: _viewModel.selectedHangInfo.rightGrip,
                    ),
                    Divider(
                      height: styles.Measurements.m,
                    ),
                    NumberInputAndDescription<int>(
                      enabled: true,
                      description: 'hang time seconds',
                      handleValueChanged: _viewModel.setHangTime,
                      initialValue: _viewModel.selectedHangInfo.duration,
                    ),
                    Divider(
                      height: styles.Measurements.m,
                    ),
                    NumberInputAndDescription<double>(
                      enabled: true,
                      description:
                          '${_viewModel.selectedHangInfo.weightUnit.unitText} added weight',
                      handleValueChanged: _viewModel.setAddedWeight,
                      initialValue: _viewModel.selectedHangInfo.addedWeight,
                    ),
                  ],
                ),
                Divider(
                  height: styles.Measurements.l,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(color: styles.Colors.lighestGray),
                ),
                Expanded(
                  child: CupertinoPicker(
//                      scrollController:
//                          FixedExtentScrollController(initialItem: initialItem),
                    useMagnifier: false,
                    magnification: 1,
                    backgroundColor: styles.Colors.bgWhite,
                    onSelectedItemChanged: (int index) {},
                    itemExtent: 40,
                    children: <Widget>[
                      ..._viewModel.editHangInfoList
                          .map((EditHangInfo info) => RichText(
                                text: TextSpan(
                                    text: '',
                                    style: styles.Lato.xsBlack,
                                    children: [
                                      TextSpan(
                                          text: 'Hang ',
                                          style: styles.Staatliches.xsBlack),
                                      TextSpan(
                                          text:
                                              '${info.currentHang}/${_viewModel.totalHangs}',
                                          style: styles.Lato.xsBlack),
                                    ]),
                              ))
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(color: styles.Colors.lighestGray),
                ),
              ],
            ),
          ),
          Button(
            handleTap: () => Navigator.of(context).pop(),
            text: 'Done',
            small: true,
            displayBackground: false,
          )
        ],
      ),
    );
  }
}
