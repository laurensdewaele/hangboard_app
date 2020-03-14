import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'package:app/services/keyboard.dart';

// KeyboardAndToastProvider has to be on top of the widget tree.
class KeyboardListView extends StatefulWidget {
  KeyboardListView({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  _KeyboardListViewState createState() => _KeyboardListViewState();
}

class _KeyboardListViewState extends State<KeyboardListView> {
  final ScrollController _scrollController = ScrollController();

  double _keyboardOffsetHeight;
  KeyboardService _keyboardService;
  StreamSubscription<double> _subscription;

  @override
  void initState() {
    super.initState();
    _keyboardService = Provider.of<KeyboardService>(context, listen: false);
    _subscription = _keyboardService.keyboardOffsetHeightStream
        .listen(_handleKeyboardOffset);
  }

  void _handleKeyboardOffset(double height) {
    setState(() {
      _keyboardOffsetHeight = height;
    });

    final double originalScrollDifference =
        _scrollController.position.maxScrollExtent - _scrollController.offset;

    if (height != 0) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent - originalScrollDifference,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        children: [
          ...widget.children,
          SizedBox(
            height: _keyboardOffsetHeight,
          )
        ]);
  }
}
