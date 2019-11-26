import 'dart:async';

import 'package:flutter/cupertino.dart' hide Icon;

import 'package:app/models/workout_ui_configuration.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/widgets/card.dart';
import 'package:app/widgets/counter.dart';
import 'package:app/widgets/dividers.dart';
import 'package:app/widgets/icon.dart';
import 'package:app/widgets/integer_input.dart';
import 'package:app/widgets/screen.dart';
import 'package:app/widgets/slider.dart';

class NewWorkoutScreen extends StatefulWidget {
  NewWorkoutScreen({this.workoutSections});
  final List<WorkoutSection> workoutSections;

  @override
  _NewWorkoutScreenState createState() => _NewWorkoutScreenState();
}

class _NewWorkoutScreenState extends State<NewWorkoutScreen> {
  final StreamController<bool> _shouldLoseFocusController =
      StreamController<bool>.broadcast();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _shouldLoseFocusController.close();
  }

  void _onScreenTap() {
    _shouldLoseFocusController.sink.add(true);
  }

  void _handleIntValueChanged(
      int value,
      GeneralWorkoutConfigurationProperties generalWorkoutConfigurationProperty,
      HoldWorkoutConfigurationProperties holdWorkoutConfigurationProperty,
      ExtraWorkoutConfigurationProperties extraWorkoutConfigurationProperty) {}

  Widget _determineInputElement(WorkoutElement workoutElement) {
    switch (workoutElement.workoutInputType) {
      case WorkoutInputTypes.counter:
        return Counter(
          initialIntValue: workoutElement.initialIntValue,
          description: workoutElement.description,
          handleValueChanged: (int value) => {
            _handleIntValueChanged(
                value,
                workoutElement.generalWorkoutConfigurationProperty,
                workoutElement.holdWorkoutConfigurationProperty,
                workoutElement.extraWorkoutConfigurationProperty)
          },
        );
        break;
      case WorkoutInputTypes.slider:
        return Slider(
          minIntValue: workoutElement.minIntValue,
          maxIntValue: workoutElement.maxIntValue,
          initialIntValue: workoutElement.initialIntValue,
          description: workoutElement.description,
          handleValueChanged: (int value) => {
            _handleIntValueChanged(
                value,
                workoutElement.generalWorkoutConfigurationProperty,
                workoutElement.holdWorkoutConfigurationProperty,
                workoutElement.extraWorkoutConfigurationProperty)
          },
        );
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScreenTap,
      child: Screen(
          gradientStartColor: styles.Colors.primary,
          gradientStopColor: styles.Colors.bgRedStop,
          child: ListView(physics: ClampingScrollPhysics(), children: [
            Column(
              children: <Widget>[
                _TopNavigation(title: 'New workout'),
                Card(
                  padding: EdgeInsets.symmetric(
                      horizontal: styles.Measurements.m,
                      vertical: styles.Measurements.l),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ...widget.workoutSections
                          .map((WorkoutSection workoutSection) {
                        return Container(
                          width: double.infinity,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                child: Text(workoutSection.title,
                                    style: styles.Typography.title),
                              ),
                              Divider(height: styles.Measurements.l),
                              ...workoutSection.workoutElements
                                  .map((WorkoutElement workoutElement) {
                                    return [
                                      Container(
                                          width: double.infinity,
                                          child: Row(
                                            children: <Widget>[
                                              IntegerInput(
                                                  initialIntValue:
                                                      workoutElement
                                                          .initialIntValue,
                                                  shouldLoseFocusStream:
                                                      _shouldLoseFocusController
                                                          .stream),
                                              SizedBox(
                                                width: styles.Measurements.s,
                                              ),
                                              Text(workoutElement.description,
                                                  style: styles.Typography.text)
                                            ],
                                          )),
                                      Divider(
                                        height: styles.Measurements.m,
                                      )
                                    ];
                                  })
                                  .expand((inputElementPlusDivider) =>
                                      inputElementPlusDivider)
                                  .toList(),
                              Divider(height: styles.Measurements.l),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            )
          ])),
    );
  }
}

class _TopNavigation extends StatelessWidget {
  _TopNavigation({this.title});

  final String title;

  void _handleTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Stack(children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Text(title,
                  style: styles.Typography.topNavigationTitle,
                  textAlign: TextAlign.center),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => _handleTap(context),
          child: Container(
            width: styles.Measurements.xxl,
            child: Icon(
              iconData: CupertinoIcons.back,
              color: styles.Colors.white,
            ),
          ),
        ),
      ]),
      Divider(height: styles.Measurements.xxl)
    ]);
  }
}
