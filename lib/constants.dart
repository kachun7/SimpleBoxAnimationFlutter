import 'package:flutter/material.dart';

class MyMenuItem {
  final String title;
  final Curve curve;

  MyMenuItem(this.title, this.curve);
}

final menuItems = [
  MyMenuItem('bounceIn', Curves.bounceIn),
  MyMenuItem('bounceInOut', Curves.bounceInOut),
  MyMenuItem('bounceOut', Curves.bounceOut),
  MyMenuItem('decelerate', Curves.decelerate),
  MyMenuItem('ease', Curves.ease),
  MyMenuItem('easeIn', Curves.easeIn),
  MyMenuItem('easeInBack', Curves.easeInBack),
  MyMenuItem('easeInCirc', Curves.easeInCirc),
  MyMenuItem('easeInCubic', Curves.easeInCubic),
  MyMenuItem('easeInExpo', Curves.easeInExpo),
  MyMenuItem('easeInOut', Curves.easeInOut),
  MyMenuItem('easeInOutBack', Curves.easeInOutBack),
  MyMenuItem('easeInOutCirc', Curves.easeInOutCirc),
  MyMenuItem('easeInOutCubic', Curves.easeInOutCubic),
  MyMenuItem('easeInOutExpo', Curves.easeInOutExpo),
  MyMenuItem('easeInOutQuad', Curves.easeInOutQuad),
  MyMenuItem('easeInOutQuart', Curves.easeInOutQuart),
  MyMenuItem('easeInOutQuint', Curves.easeInOutQuint),
  MyMenuItem('easeInOutSine', Curves.easeInOutSine),
  MyMenuItem('easeInQuad', Curves.easeInQuad),
  MyMenuItem('easeInQuart', Curves.easeInQuart),
  MyMenuItem('easeInQuint', Curves.easeInQuint),
  MyMenuItem('easeInSine', Curves.easeInSine),
  MyMenuItem('easeInToLinear', Curves.easeInToLinear),
  MyMenuItem('easeOut', Curves.easeOut),
  MyMenuItem('easeOutBack', Curves.easeOutBack),
  MyMenuItem('easeOutCirc', Curves.easeOutCirc),
  MyMenuItem('easeOutCubic', Curves.easeOutCubic),
  MyMenuItem('easeOutExpo', Curves.easeOutExpo),
  MyMenuItem('easeOutQuad', Curves.easeOutQuad),
  MyMenuItem('easeOutQuart', Curves.easeOutQuart),
  MyMenuItem('easeOutQuint', Curves.easeOutQuint),
  MyMenuItem('easeOutSine', Curves.easeOutSine),
  MyMenuItem('elasticIn', Curves.elasticIn),
  MyMenuItem('elasticInOut', Curves.elasticInOut),
  MyMenuItem('elasticOut', Curves.elasticOut),
  MyMenuItem('fastLinearToSlowEaseIn', Curves.fastLinearToSlowEaseIn),
  MyMenuItem('fastOutSlowIn', Curves.fastOutSlowIn),
  MyMenuItem('linear', Curves.linear),
  MyMenuItem('linearToEaseOut', Curves.linearToEaseOut),
  MyMenuItem('slowMiddle', Curves.slowMiddle),
];
