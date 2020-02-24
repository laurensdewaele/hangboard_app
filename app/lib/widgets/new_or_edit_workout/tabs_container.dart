import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'package:app/styles/styles.dart' as styles;
import 'package:app/widgets/new_or_edit_workout/extra_tab.dart';
import 'package:app/widgets/new_or_edit_workout/general_tab.dart';
import 'package:app/widgets/new_or_edit_workout/hold_tab.dart';
import 'package:app/widgets/new_or_edit_workout/navigation_tabs.dart';

class TabsContainer extends StatefulWidget {
  TabsContainer(
      {Key key,
      @required this.primaryColor,
      @required this.holdCount,
      @required this.shouldLoseFocusStream,
      @required this.onNavigation,
      this.navigateForwardTabStream,
      this.navigateBackTabStream})
      : super(key: key);

  final Color primaryColor;
  final int holdCount;
  final Stream<bool> shouldLoseFocusStream;
  final VoidCallback onNavigation;
  final Stream<bool> navigateForwardTabStream;
  final Stream<bool> navigateBackTabStream;

  @override
  _TabsContainerState createState() => _TabsContainerState();
}

class _TabsContainerState extends State<TabsContainer> {
  int _activePageIndex;
  List<Widget> _pages;
  bool _firstTimeConstructed = true;
  StreamSubscription _navigateForwardTabSub;
  StreamSubscription _navigateBackTabSub;

  @override
  void initState() {
    super.initState();
    _activePageIndex = 0;
    _buildPages(widget.holdCount);
    _firstTimeConstructed = false;
    _navigateForwardTabSub =
        widget.navigateForwardTabStream.listen((bool shouldNavigate) {
      _handleForwardNavigation();
    });
    _navigateBackTabSub =
        widget.navigateBackTabStream.listen((bool shouldNavigate) {
      _handleBackNavigation();
    });
  }

  @override
  void dispose() {
    _navigateBackTabSub.cancel();
    _navigateForwardTabSub.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(TabsContainer oldWidget) {
    if (oldWidget.holdCount != widget.holdCount) {
      _buildPages(widget.holdCount);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _buildPages(
    int holdCount,
  ) {
    setState(() {
      _pages = [
        GeneralTab(
          shouldFocusOnInput: _firstTimeConstructed,
          shouldLoseFocusStream: widget.shouldLoseFocusStream,
          key: ValueKey('new-workout-page-1'),
        ),
        ...List.generate(holdCount, (i) => i).map((n) {
          return HoldTab(
            key: UniqueKey(),
            shouldLoseFocusStream: widget.shouldLoseFocusStream,
            currentHold: n,
          );
        }),
        ExtraTab(
          shouldLoseFocusStream: widget.shouldLoseFocusStream,
          key: UniqueKey(),
        )
      ];
    });
  }

  void _handleBackNavigation() {
    if (_activePageIndex == 0) {
      Navigator.of(context).pop();
    } else {
      setState(() {
        --_activePageIndex;
      });
    }
  }

  void _handleForwardNavigation() {
    if (_activePageIndex <= _pages.length - 2)
      setState(() {
        ++_activePageIndex;
      });
  }

  void _handleNavigation(int index) {
    setState(() {
      _activePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: styles.Measurements.m,
              vertical: styles.Measurements.l),
          child: _pages[_activePageIndex],
        ),
        NavigationTabs(
            primaryColor: widget.primaryColor,
            handleNavigation: _handleNavigation,
            handleBackNavigation: _handleBackNavigation,
            handleForwardNavigation: _handleForwardNavigation,
            count: _pages.length,
            activeIndex: _activePageIndex)
      ],
    );
  }
}