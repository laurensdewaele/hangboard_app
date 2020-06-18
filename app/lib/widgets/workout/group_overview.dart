import 'package:app/models/models.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/widgets/board/board_with_grips.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/dialog.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/icons.dart' as icons;
import 'package:app/widgets/sliding_card.dart';
import 'package:app/widgets/sliding_expansion_card.dart';
import 'package:app/widgets/workout_overview/delete_action.dart';
import 'package:app/widgets/workout_overview/edit_action.dart';
import 'package:flutter/cupertino.dart' hide Icon;

class GroupOverview extends StatelessWidget {
  GroupOverview(
      {Key key,
      @required this.disabled,
      @required this.groups,
      @required this.weightUnit,
      @required this.handleEditGroup,
      @required this.handleDeleteGroup})
      : super(key: key);

  final bool disabled;
  final List<Group> groups;
  final String weightUnit;
  final void Function(int index) handleEditGroup;
  final void Function(int index) handleDeleteGroup;

  void _handleLongPress(BuildContext context, int index) {
    showAppDialog(
        context: context,
        content: _EditDeleteDialog(
          title: 'group ${index + 1}/${groups.length}',
          handleBackTap: () => Navigator.of(context).pop(),
          handleEditTap: () => handleEditGroup(index),
          handleDeleteTap: () => handleDeleteGroup(index),
        ),
        smallWidth: null);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        key: ValueKey(groups.hashCode),
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: groups.length,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final Group _group = groups[index];
                final double _setRepHeaderWidth = 90;
                final _cardPadding = styles.Measurements.s;
                final _boardWidth = constraints.maxWidth -
                    _setRepHeaderWidth -
                    _cardPadding * 2;
                final _boardClippedPadding = styles.Measurements.s;
                final _boardHeight = _boardWidth / _group.board.aspectRatio;
                final _boardWithGripsHeight =
                    _boardHeight + _boardClippedPadding;
                return SlidingCard(
                  disabled: disabled,
                  key: UniqueKey(),
                  border: true,
                  divider: groups.length > 1 && index != groups.length - 1,
                  dividerHeight: styles.Measurements.m,
                  handleLeftActionTap: () => handleEditGroup(index),
                  handleRightActionTap: () => handleDeleteGroup(index),
                  leftAction: EditAction(),
                  rightAction: DeleteAction(),
                  handleLongPress: () => _handleLongPress(context, index),
                  content: SlidingExpansionCard(
                    topLeftSection: BoardWithGrips(
                      clipped: true,
                      rightGrip: _group.rightGrip,
                      leftGrip: _group.leftGrip,
                      rightGripBoardHold: _group.rightGripBoardHold,
                      leftGripBoardHold: _group.leftGripBoardHold,
                      boardAspectRatio: _group.board.aspectRatio,
                      customBoardHoldImages:
                          _group.board.customBoardHoldImages?.toList(),
                      handToBoardHeightRatio:
                          _group.board.handToBoardHeightRatio,
                      withFixedHeight: false,
                      boardImageAsset: _group.board.imageAsset,
                      boardImageAssetWidth: _group.board.imageAssetWidth,
                    ),
                    topRightSection: Container(
                      width: _setRepHeaderWidth,
                      height: _boardWithGripsHeight,
                      child: _RepSetHeader(
                        sets: _group.sets,
                        repetitions: _group.repetitions,
                      ),
                    ),
                    topRightSectionWidth: _setRepHeaderWidth,
                    handleTap: () {},
                    content: _GroupInfo(
                      weightUnit: weightUnit,
                      group: _group,
                    ),
                    handleLongPress: () => _handleLongPress(context, index),
                  ),
                );
              });
        });
  }
}

class _RepSetHeader extends StatelessWidget {
  const _RepSetHeader({
    @required this.repetitions,
    @required this.sets,
  });

  final int repetitions;
  final int sets;

  @override
  Widget build(BuildContext context) {
    Widget _text = Text(
      'X$repetitions',
      style: styles.Staatliches.groupRepSetHeaderLarge,
      textAlign: TextAlign.center,
    );

    if (sets != null && sets > 1) {
      _text = Text(
        'X$repetitions X$sets',
        style: styles.Staatliches.groupRepSetHeaderSmall,
        textAlign: TextAlign.center,
      );
    }

    return Center(
      child: _text,
    );
  }
}

class _GroupInfo extends StatelessWidget {
  const _GroupInfo({@required this.group, @required this.weightUnit});

  final Group group;
  final String weightUnit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: styles.Measurements.s),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                  text: 'Repetitions: ',
                  style: styles.Staatliches.xsBlack,
                  children: [
                    TextSpan(
                        text: group.repetitions.toString(),
                        style: styles.Lato.xsGray),
                  ]),
            ),
            RichText(
              text: TextSpan(
                  text: 'Hang time: ',
                  style: styles.Staatliches.xsBlack,
                  children: [
                    TextSpan(
                        text: '${group.hangTimeS.toString()}s',
                        style: styles.Lato.xsGray),
                  ]),
            ),
            if (group.restBetweenRepsFixed == true)
              RichText(
                text: TextSpan(
                    text: 'Rest between repetitions: ',
                    style: styles.Staatliches.xsBlack,
                    children: [
                      TextSpan(
                          text: '${group.restBetweenRepsS.toString()}s',
                          style: styles.Lato.xsGray),
                    ]),
              ),
            if (group.restBetweenRepsFixed == false)
              RichText(
                text: TextSpan(
                    text: 'Rest between repetitions: ',
                    style: styles.Staatliches.xsBlack,
                    children: [
                      TextSpan(text: 'variable', style: styles.Lato.xsGray),
                    ]),
              ),
            if (group.sets != null && group.sets > 1)
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                    text: 'sets: ',
                    style: styles.Staatliches.xsBlack,
                    children: [
                      TextSpan(
                          text: group.sets.toString(),
                          style: styles.Lato.xsGray),
                    ]),
              ),
            if (group.sets != null &&
                group.sets > 1 &&
                group.restBetweenSetsFixed == true)
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                    text: 'rest between sets: ',
                    style: styles.Staatliches.xsBlack,
                    children: [
                      TextSpan(
                          text: '${group.restBetweenSetsS}s',
                          style: styles.Lato.xsGray),
                    ]),
              ),
            if (group.sets != null &&
                group.sets > 1 &&
                group.restBetweenSetsFixed == false)
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                    text: 'rest between sets: ',
                    style: styles.Staatliches.xsBlack,
                    children: [
                      TextSpan(text: 'variable', style: styles.Lato.xsGray),
                    ]),
              ),
            if (group.addedWeight != null && group.addedWeight != 0.0)
              RichText(
                textAlign: TextAlign.right,
                text: TextSpan(
                    text: 'added weight: ',
                    style: styles.Staatliches.xsBlack,
                    children: [
                      TextSpan(
                          text: '${group.addedWeight.toString()} $weightUnit',
                          style: styles.Lato.xsGray),
                    ]),
              ),
          ],
        ),
      ),
    );
  }
}

class _EditDeleteDialog extends StatelessWidget {
  _EditDeleteDialog(
      {Key key,
      @required this.title,
      @required this.handleDeleteTap,
      @required this.handleEditTap,
      @required this.handleBackTap})
      : super(key: key);

  final String title;
  final VoidCallback handleEditTap;
  final VoidCallback handleDeleteTap;
  final VoidCallback handleBackTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title, style: styles.Staatliches.lBlack),
        Divider(height: styles.Measurements.l),
        Button(
            text: 'Edit',
            backgroundColor: styles.Colors.blue,
            displayBackground: true,
            leadingIcon: icons.editIconWhiteXl,
            handleTap: handleEditTap,
            leadingIconTextCentered: true),
        Divider(height: styles.Measurements.m),
        Button(
            text: 'Delete',
            backgroundColor: styles.Colors.primary,
            displayBackground: true,
            leadingIcon: icons.deleteIconWhiteXl,
            handleTap: handleDeleteTap,
            leadingIconTextCentered: true),
        Divider(height: styles.Measurements.l),
        Button(
            displayBackground: false,
            text: 'Back',
            handleTap: handleBackTap,
            small: true)
      ],
    );
  }
}