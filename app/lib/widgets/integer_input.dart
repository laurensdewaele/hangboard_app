import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:app/styles/styles.dart' as styles;

class IntegerInput extends StatefulWidget {
  IntegerInput(
      {this.initialIntValue,
      this.handleValueChanged,
      this.shouldLoseFocusStream,
      this.handleErrorMessage,
      this.isFirst});

  final int initialIntValue;
  final ValueChanged<int> handleValueChanged;
  final Stream<bool> shouldLoseFocusStream;
  final Function(Widget) handleErrorMessage;
  final bool isFirst;

  @override
  _IntegerInputState createState() => _IntegerInputState();
}

class _IntegerInputState extends State<IntegerInput> {
  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.initialIntValue.toString();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus != true) {
        _validateInput();
      }
    });
    _subscription = widget.shouldLoseFocusStream
        .listen((shouldLoseFocus) => {_validateInput()});
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  void _validateInput() {
    int value;
    try {
      value = int.parse(_textEditingController.text);
    } on FormatException catch (_) {
      _validationError();
    }

    if (value != null && value < 1) {
      _validationError();
    }

    if (value != null && value > 1) {
      widget.handleValueChanged(value);
    }

    _focusNode.unfocus();
  }

  void _validationError() {
    _textEditingController.text = widget.initialIntValue.toString();
    widget.handleErrorMessage(RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Please input a value ',
          style: styles.Typography.toast,
          children: [
            TextSpan(
                text: 'bigger than 0.', style: styles.Typography.toastBold),
          ]),
    ));
  }

  void _onTap() {
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: styles.Measurements.xl,
      child: CupertinoTextField(
        autofocus: widget.isFirst,
        autocorrect: false,
        controller: _textEditingController,
        cursorColor: styles.Colors.white,
        decoration: BoxDecoration(
            color: styles.Colors.primary,
            borderRadius: styles.kAppBorderRadiusAll),
        focusNode: _focusNode,
        keyboardType: TextInputType.number,
        maxLength: 3,
        onTap: _onTap,
        onEditingComplete: _validateInput,
        onSubmitted: (String text) => {_validateInput},
        style: styles.Typography.inputDescriptionSquare,
        textAlign: TextAlign.center,
      ),
    );
  }
}