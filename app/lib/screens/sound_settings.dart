import 'dart:async';

import 'package:flutter/cupertino.dart' hide Icon;
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

import 'package:provider/provider.dart';

import 'package:app/data/sounds.dart';
import 'package:app/styles/styles.dart' as styles;
import 'package:app/view_models/sound_settings_vm.dart';
import 'package:app/widgets/card.dart';
import 'package:app/widgets/divider.dart';
import 'package:app/widgets/keyboard_screen.dart';
import 'package:app/widgets/number_input_and_description.dart';
import 'package:app/widgets/radio_button.dart';
import 'package:app/widgets/section.dart';
import 'package:app/widgets/toast.dart';
import 'package:app/widgets/top_navigation.dart';

class SoundSettingsScreen extends StatefulWidget {
  SoundSettingsScreen({Key key}) : super(key: key);

  @override
  _SoundSettingsScreenState createState() => _SoundSettingsScreenState();
}

class _SoundSettingsScreenState extends State<SoundSettingsScreen> {
  final StreamController<bool> _shouldLoseFocusStreamController =
      StreamController<bool>.broadcast();
  final ScrollController _scrollController = ScrollController();

  double _keyboardOffsetHeight = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _shouldLoseFocusStreamController.close();
    super.dispose();
  }

  void _onScreenTap() {
    _shouldLoseFocusStreamController.sink.add(true);
    setState(() {
      _keyboardOffsetHeight = 0;
    });
  }

  void _handleKeyboardOffset(Offset offset) {
    setState(() {
      _keyboardOffsetHeight = offset.dy;
    });

    if (offset.dy == 0) return;

    final double originalScrollDifference =
        _scrollController.position.maxScrollExtent - _scrollController.offset;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent - originalScrollDifference,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity > 0) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: _onScreenTap,
          child: KeyBoardScreen(
              handleKeyboardOffset: _handleKeyboardOffset,
              gradientStartColor: styles.Colors.bgGrayStart,
              gradientStopColor: styles.Colors.bgGrayStop,
              child: ListView(
                  controller: _scrollController,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Column(
                      children: <Widget>[
                        TopNavigation(
                          title: 'sound settings',
                          dark: true,
                        ),
                        Divider(height: styles.Measurements.xxl),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: styles.Measurements.xs),
                          child: GestureDetector(
                            onHorizontalDragEnd: _onHorizontalDragEnd,
                            child: Card(
                              child: Consumer<SoundSettingsViewModel>(
                                builder: (context,
                                    _soundSettingsScreenViewModel, child) {
                                  return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: styles.Measurements.m,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Divider(
                                                  height: styles.Measurements.l,
                                                ),
                                                Section(
                                                  title: 'hang sound',
                                                  children: <Widget>[
                                                    RadioButton(
                                                      description:
                                                          Sounds.thudDeep.name,
                                                      value: Sounds.thudDeep,
                                                      active:
                                                          _soundSettingsScreenViewModel
                                                                  .appState
                                                                  .settings
                                                                  .hangSound ==
                                                              Sounds.thudDeep,
                                                      handleSelected: (dynamic
                                                              s) =>
                                                          _soundSettingsScreenViewModel
                                                              .setHangSound(s),
                                                    ),
                                                    RadioButton(
                                                      description: Sounds
                                                          .thudHollow.name,
                                                      value: Sounds.thudHollow,
                                                      active:
                                                          _soundSettingsScreenViewModel
                                                                  .appState
                                                                  .settings
                                                                  .hangSound ==
                                                              Sounds.thudHollow,
                                                      handleSelected: (dynamic
                                                              s) =>
                                                          _soundSettingsScreenViewModel
                                                              .setHangSound(s),
                                                    ),
                                                    RadioButton(
                                                      description:
                                                          Sounds.thudSoft.name,
                                                      value: Sounds.thudSoft,
                                                      active:
                                                          _soundSettingsScreenViewModel
                                                                  .appState
                                                                  .settings
                                                                  .hangSound ==
                                                              Sounds.thudSoft,
                                                      handleSelected: (dynamic
                                                              s) =>
                                                          _soundSettingsScreenViewModel
                                                              .setHangSound(s),
                                                    ),
                                                    RadioButton(
                                                      description:
                                                          Sounds.off.name,
                                                      value: Sounds.off,
                                                      active:
                                                          _soundSettingsScreenViewModel
                                                                  .appState
                                                                  .settings
                                                                  .hangSound ==
                                                              Sounds.off,
                                                      handleSelected: (dynamic
                                                              s) =>
                                                          _soundSettingsScreenViewModel
                                                              .setHangSound(s),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Divider(
                                          height: styles.Measurements.xxl,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: styles.Measurements.m,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Section(
                                                  title: 'rest sound',
                                                  children: <Widget>[
                                                    RadioButton(
                                                      description:
                                                          Sounds.gong.name,
                                                      value: Sounds.gong,
                                                      active:
                                                          _soundSettingsScreenViewModel
                                                                  .appState
                                                                  .settings
                                                                  .restSound ==
                                                              Sounds.gong,
                                                      handleSelected: (dynamic
                                                              s) =>
                                                          _soundSettingsScreenViewModel
                                                              .setHangSound(s),
                                                    ),
                                                    RadioButton(
                                                      description:
                                                          Sounds.off.name,
                                                      value: Sounds.off,
                                                      active:
                                                          _soundSettingsScreenViewModel
                                                                  .appState
                                                                  .settings
                                                                  .restSound ==
                                                              Sounds.off,
                                                      handleSelected: (dynamic
                                                              s) =>
                                                          _soundSettingsScreenViewModel
                                                              .setHangSound(s),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Divider(
                                          height: styles.Measurements.xxl,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: styles.Measurements.m,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Section(
                                                  title: 'beep sound',
                                                  children: <Widget>[
                                                    RadioButton(
                                                      description: Sounds
                                                          .hitLightSoft.name,
                                                      value:
                                                          Sounds.hitLightSoft,
                                                      active:
                                                          _soundSettingsScreenViewModel
                                                                  .appState
                                                                  .settings
                                                                  .beepSound ==
                                                              Sounds
                                                                  .hitLightSoft,
                                                      handleSelected: (dynamic
                                                              s) =>
                                                          _soundSettingsScreenViewModel
                                                              .setHangSound(s),
                                                    ),
                                                    RadioButton(
                                                      description: Sounds
                                                          .hitLightHard.name,
                                                      value:
                                                          Sounds.hitLightHard,
                                                      active:
                                                          _soundSettingsScreenViewModel
                                                                  .appState
                                                                  .settings
                                                                  .beepSound ==
                                                              Sounds
                                                                  .hitLightHard,
                                                      handleSelected: (dynamic
                                                              s) =>
                                                          _soundSettingsScreenViewModel
                                                              .setHangSound(s),
                                                    ),
                                                    RadioButton(
                                                      description:
                                                          Sounds.off.name,
                                                      value: Sounds.off,
                                                      active:
                                                          _soundSettingsScreenViewModel
                                                                  .appState
                                                                  .settings
                                                                  .beepSound ==
                                                              Sounds.off,
                                                      handleSelected: (dynamic
                                                              s) =>
                                                          _soundSettingsScreenViewModel
                                                              .setHangSound(s),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Divider(
                                          height: styles.Measurements.xxl,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: styles.Measurements.m,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Section(
                                                  title: 'indicator beeps',
                                                  children: <Widget>[
                                                    NumberInputAndDescription(
                                                      isDouble: false,
                                                      description:
                                                          'beeps before hang',
                                                      initialValue:
                                                          _soundSettingsScreenViewModel
                                                              .appState
                                                              .settings
                                                              .beepsBeforeHang
                                                              .toDouble(),
                                                      handleIntValueChanged: (int
                                                              v) =>
                                                          _soundSettingsScreenViewModel
                                                              .setBeepsBeforeHang(
                                                                  v),
                                                      shouldLoseFocusStream:
                                                          _shouldLoseFocusStreamController
                                                              .stream,
                                                      shouldFocus: false,
                                                    ),
                                                    NumberInputAndDescription(
                                                      isDouble: false,
                                                      description:
                                                          'beeps before rest',
                                                      initialValue:
                                                          _soundSettingsScreenViewModel
                                                              .appState
                                                              .settings
                                                              .beepsBeforeRest
                                                              .toDouble(),
                                                      handleIntValueChanged: (int
                                                              v) =>
                                                          _soundSettingsScreenViewModel
                                                              .setBeepsBeforeRest(
                                                                  v),
                                                      shouldLoseFocusStream:
                                                          _shouldLoseFocusStreamController
                                                              .stream,
                                                      shouldFocus: false,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                          height: _keyboardOffsetHeight,
                                        )
                                      ]);
                                },
                              ),
                            ),
                          ),
                        ),
                        Divider(height: styles.Measurements.xxl)
                      ],
                    )
                  ])),
        ),
        Toast(),
      ],
    );
  }
}
