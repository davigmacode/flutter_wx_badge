import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant badges should look like.
class WxBadgeTheme extends InheritedTheme {
  /// The properties for descendant [Badge]s
  final WxBadgeThemeData data;

  /// Creates a theme that controls
  /// how descendant [WxBadgeTheme]s should look like.
  const WxBadgeTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// Creates an [WxBadgeTheme] that controls the style of
  /// descendant widgets, and merges in the current [WxBadgeTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curveIn,
    Curve? curveOut,
    Duration? duration,
    AlignmentGeometry? alignment,
    Offset? offset,
    WxBadgeStyle? style,
    WxBadgeThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = WxBadgeTheme.of(context);
        return WxBadgeTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curveIn: curveIn,
                curveOut: curveOut,
                duration: duration,
                position: alignment,
                offset: offset,
                style: style,
              ),
          child: child,
        );
      },
    );
  }

  /// The [WxBadgeTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// BadgeThemeData theme = BadgeTheme.of(context);
  /// ```
  static WxBadgeThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<WxBadgeTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<WxBadgeThemeData>();
    final defaultTheme = WxBadgeThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return WxBadgeTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(WxBadgeTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<WxBadgeThemeData>('data', data));
  }
}
