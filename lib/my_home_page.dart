import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:simple_box_animation/constants.dart';

enum MyType { opacity, padding }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final outerPadding = 4.0;
  final innerPadding = 4.0;
  final boxSize = 40.0;

  final _colors = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.brown,
    Colors.grey,
  ];
  var _intervalsPositions = <double>[];
  List<DropdownMenuItem<int>> _dropDownMenuItems;

  AnimationController _animationController;
  var _animationStarted = false;

  var _currentOpacityIndex = 0;
  var _currentPaddingIndex = 0;

  @override
  void initState() {
    _intervalsPositions = List.generate(_colors.length, (index) => index.toDouble() / _colors.length.toDouble());

    _dropDownMenuItems = List.generate(
      menuItems.length,
      (index) => DropdownMenuItem(value: index, child: Text(menuItems[index].title)),
    );

    _changedDropDownItem(MyType.opacity, 0);
    _changedDropDownItem(MyType.padding, 0);

    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 167 * _colors.length));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Box Animation')),
      body: _body(context),
      floatingActionButton: FloatingActionButton(onPressed: _startAnimation, child: Icon(Icons.refresh)),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(outerPadding),
      child: Column(
        children: <Widget>[
          Container(
            height: boxSize,
           padding: EdgeInsets.all(innerPadding),
            child: Stack(
              alignment: Alignment.centerLeft,
              fit: StackFit.expand,
              children: <Widget>[
                ...List.generate(_colors.length, _child).reversed,
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Opacity'),
                  Spacer(),
                  DropdownButton(
                      value: _currentOpacityIndex, items: _dropDownMenuItems, onChanged: (value) => _changedDropDownItem(MyType.opacity, value)),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Padding'),
                  Spacer(),
                  DropdownButton(
                      value: _currentPaddingIndex, items: _dropDownMenuItems, onChanged: (value) => _changedDropDownItem(MyType.padding, value)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _child(int index) {
    final screenWidth = MediaQuery.of(context).size.width - outerPadding * 2;
    final color = _colors[index];

    final beginInterval = _safeValue(_intervalsPositions[index]);
    final endSafeInterval = index + 1 < _intervalsPositions.length ? _intervalsPositions[index + 1] : 1.0;

    final beginLeftMargin = innerPadding;
    final beginLeftPadding = beginLeftMargin + index > 1 ? (index - 1).toDouble() * boxSize : 0.0;
    final beginRightPadding = screenWidth - boxSize - beginLeftPadding;

    final endLeftMargin = innerPadding;
    final endLeftPadding = endLeftMargin + index.toDouble() * boxSize;
    final endRightPadding = screenWidth - endLeftPadding - boxSize - endLeftMargin;

    final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(_safeValue(beginInterval), _safeValue(endSafeInterval), curve: menuItems[_currentOpacityIndex].curve),
      ),
    );

    final paddingAnimation = EdgeInsetsTween(
      begin: EdgeInsets.only(left: beginLeftPadding, right: beginRightPadding),
      end: EdgeInsets.only(left: endLeftPadding, right: endRightPadding),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, _safeValue(endSafeInterval), curve: menuItems[_currentPaddingIndex].curve),
      ),
    );

    return AnimatedBuilder(
      builder: (context, child) => Container(
        padding: _safeEdgeInsets(paddingAnimation.value),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Opacity(
            opacity: _safeValue(opacityAnimation.value),
            child: Container(width: boxSize, height: boxSize, color: color),
          ),
        ),
      ),
      animation: _animationController,
    );
  }

  void _changedDropDownItem(MyType type, int selectedIndex) {
    _resetAnimation();
    if (type == MyType.opacity) {
      _currentOpacityIndex = selectedIndex;
    } else {
      _currentPaddingIndex = selectedIndex;
    }
    setState(() {});
  }

  void _resetAnimation() {
    if (_animationStarted) {
      _animationStarted = false;
      _animationController.reset();
    }
  }

  void _startAnimation() {
    _resetAnimation();
    _animationController.forward().orCancel;
    _animationStarted = !_animationStarted;
  }

  double _safeValue(double value) {
    if (value <= 0.0) return 0.0;
    if (value >= 1.0) return 1.0;
    return value;
  }

  EdgeInsets _safeEdgeInsets(EdgeInsets value) {
    return EdgeInsets.fromLTRB(math.max(value.left, 0.0), value.top, math.max(value.right, 0.0), value.bottom);
  }
}
