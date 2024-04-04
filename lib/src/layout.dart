import 'package:flutter/widgets.dart';

typedef WxBadgeLayoutBuilder = AnimatedSwitcherLayoutBuilder;

abstract class WxBadgeLayout {
  /// The new child is placed in a [Stack] that sizes itself to match the
  /// largest of the child or a previous child. The children are centered on
  /// each other.
  static const defaults = AnimatedSwitcher.defaultLayoutBuilder;
}
