import 'package:flutter/cupertino.dart' hide Icon;

import 'package:app/styles/styles.dart' as styles;
import 'package:app/widgets/button.dart';
import 'package:app/widgets/dialog.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/icon.dart';
import 'package:app/widgets/icon_button.dart';
import 'package:app/widgets/number_input_and_description.dart';

class RateWorkoutContent extends StatelessWidget {
  RateWorkoutContent(
      {Key key,
      @required this.handleCompleteWorkoutButtonTap,
      @required this.handleFeltDifficultyValueChanged})
      : super(key: key);

  final void Function(int v) handleFeltDifficultyValueChanged;
  final VoidCallback handleCompleteWorkoutButtonTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Divider(
                height: styles.Measurements.xs,
              ),
              Row(
                children: [
                  Text(
                    'Felt difficulty level',
                    style: styles.Staatliches.xlBlack,
                  ),
                  IconButton(
                      handleTap: () {
                        showAppDialog(
                            context: context,
                            content: _FeltDifficultyLevelInfo());
                      },
                      icon: Icon(
                        size: 28,
                        iconData: IconData(0xf44c,
                            fontFamily: 'CupertinoIcons',
                            fontPackage: 'cupertino_icons'),
                        color: styles.Colors.black,
                      ))
                ],
              ),
              NumberInputAndDescription(
                shouldFocus: true,
                enabled: true,
                primaryColor: styles.Colors.turquoise,
                isDouble: false,
                description: 'felt difficulty',
                handleIntValueChanged: handleFeltDifficultyValueChanged,
                initialIntValue: 0,
                maxIntValue: 10,
              ),
            ],
          ),
        ),
        Button(
          backgroundColor: styles.Colors.turquoise,
          width: double.infinity,
          text: 'done',
          handleTap: handleCompleteWorkoutButtonTap,
        ),
      ],
    );
  }
}

class _FeltDifficultyLevelInfo extends StatelessWidget {
  _FeltDifficultyLevelInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'This value signifies how hard the workout was for you.',
              style: styles.Lato.xsBlack,
            ),
            RichText(
              text: TextSpan(
                  text: 'Or, in other words, ',
                  style: styles.Lato.xsBlack,
                  children: [
                    TextSpan(
                        text: 'how difficult it felt to complete the workout',
                        style: styles.Lato.xsBlackBold),
                    TextSpan(
                        text: ', on a scale of 1 to 10.',
                        style: styles.Lato.xsBlack),
                  ]),
            ),
            Divider(
              height: styles.Measurements.m,
            ),
            Text(
              'As all things in life, this will not be constant.',
              style: styles.Lato.xsBlack,
            ),
            Text(
              'On good days this workout might not have been very hard, whereas on lesser days, it might seem really difficult to hold on.',
              style: styles.Lato.xsBlack,
            ),
            Divider(
              height: styles.Measurements.m,
            ),
            Text(
              'However, as we continually stimulate the body to adjust to the stresses of fingerboarding, we should see a particular exercise become easier over time.',
              style: styles.Lato.xsBlack,
            ),
            Divider(
              height: styles.Measurements.m,
            ),
            RichText(
              text: TextSpan(
                  text:
                      'Therefore, we kindly request you to fill out this value, ',
                  style: styles.Lato.xsBlack,
                  children: [
                    TextSpan(
                        text: 'so you can better track your progression.',
                        style: styles.Lato.xsBlackBold),
                  ]),
            ),
            Divider(
              height: styles.Measurements.xxl,
            ),
            Transform.scale(
              scale: .8,
              child: Button(
                  displayBackground: false,
                  text: 'Ok',
                  handleTap: () {
                    Navigator.of(context).pop();
                  }),
            )
          ],
        )
      ],
    );
  }
}