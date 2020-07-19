import 'package:flutter/cupertino.dart';
import 'package:tenso_app/styles/styles.dart' as styles;
import 'package:tenso_app/widgets/button.dart';
import 'package:tenso_app/widgets/divider.dart';

class FixedVariableTimerInfo extends StatelessWidget {
  FixedVariableTimerInfo({Key key}) : super(key: key);

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
            RichText(
              text: TextSpan(text: '', style: styles.Lato.xsBlack, children: [
                TextSpan(text: 'Variable ', style: styles.Lato.xsBlackBold),
                TextSpan(
                    text:
                        'will display a stopwatch timer, so you can decide on the fly how much rest you need.',
                    style: styles.Lato.xsBlack),
              ]),
            ),
            Divider(
              height: styles.Measurements.m,
            ),
            RichText(
              text: TextSpan(text: '', style: styles.Lato.xsBlack, children: [
                TextSpan(text: 'Fixed ', style: styles.Lato.xsBlackBold),
                TextSpan(
                    text:
                        'will display a countdown timer with a predetermined amount of seconds. This way, you\'re enforcing sufficient and consistent recovery time.',
                    style: styles.Lato.xsBlack),
              ]),
            ),
            Divider(
              height: styles.Measurements.l,
            ),
            Button(
                small: true,
                displayBackground: false,
                text: 'Ok',
                handleTap: () {
                  Navigator.of(context).pop();
                })
          ],
        )
      ],
    );
  }
}