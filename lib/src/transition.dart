import 'package:flutter/widgets.dart';

typedef WxBadgeTransitionBuilder = AnimatedSwitcherTransitionBuilder;

abstract class WxBadgeTransition {
  /// The new child is given a [FadeTransition] which increases opacity as
  /// the animation goes from 0.0 to 1.0, and decreases when the animation is reversed.
  static const fade = AnimatedSwitcher.defaultTransitionBuilder;

  /// The new child is given a [ScaleTransition] which increases scale as
  /// the animation goes from 0.0 to 1.0, and decreases when the animation is reversed.
  static const scale = _scale;
  static Widget _scale(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}
