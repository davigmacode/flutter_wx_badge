import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wx_utils/wx_utils.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [WxBadge].
///
/// Descendant widgets obtain the current [WxBadgeThemeData] object using
/// `WxBadgeTheme.of(context)`. Instances of [WxBadgeThemeData]
/// can be customized with [WxBadgeThemeData.copyWith] or [WxBadgeThemeData.merge].
@immutable
class WxBadgeThemeData extends ThemeExtension<WxBadgeThemeData>
    with Diagnosticable {
  /// Whether to animate the badge decoration.
  final bool animated;

  /// The animation curve to use when transitioning in a new badge content.
  final Curve curve;

  /// The animation curve to use when transitioning a previous badge content out.
  final Curve? curveOut;

  /// The duration of the transition from the old [content] value to the new one.
  final Duration duration;

  /// The duration of the transition from the new [content] value to the old one.
  final Duration? durationOut;

  /// Align the badge content within the child.
  final AlignmentGeometry position;

  /// Offset of the badge content
  final Offset offset;

  /// The [WxBadgeStyle] to be applied to the badge widget
  final WxBadgeStyle style;

  /// Creates a theme data that can be used for [BadgeTheme].
  const WxBadgeThemeData({
    required this.animated,
    required this.curve,
    this.curveOut,
    required this.duration,
    this.durationOut,
    required this.position,
    required this.offset,
    required this.style,
  });

  /// An [WxBadgeThemeData] with some reasonable default values.
  static const fallback = WxBadgeThemeData(
    animated: false,
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    position: Alignment.topRight,
    offset: Offset.zero,
    style: WxBadgeStyle.defaults,
  );

  /// Creates a [WxBadgeThemeData] from another one that probably null.
  WxBadgeThemeData.from([WxBadgeThemeData? other])
      : animated = other?.animated ?? fallback.animated,
        curve = other?.curve ?? fallback.curve,
        curveOut = other?.curveOut ?? fallback.curveOut,
        duration = other?.duration ?? fallback.duration,
        durationOut = other?.durationOut ?? fallback.durationOut,
        position = other?.position ?? fallback.position,
        offset = other?.offset ?? fallback.offset,
        style = other?.style ?? fallback.style;

  /// A [WxBadgeThemeData] with default values.
  factory WxBadgeThemeData.defaults(BuildContext context) =>
      WxBadgeThemeDefaults(context);

  /// Creates a copy of this [WxBadgeThemeData] but with
  /// the given fields replaced with the new values.
  @override
  WxBadgeThemeData copyWith({
    bool? animated,
    Curve? curve,
    Curve? curveOut,
    Duration? duration,
    Duration? durationOut,
    AlignmentGeometry? position,
    Offset? offset,
    WxBadgeStyle? style,
  }) {
    return WxBadgeThemeData(
      animated: animated ?? this.animated,
      curve: curve ?? this.curve,
      curveOut: curveOut ?? this.curveOut,
      duration: duration ?? this.duration,
      durationOut: durationOut ?? this.durationOut,
      position: position ?? this.position,
      offset: offset ?? this.offset,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [WxBadgeThemeData] but with
  /// the given fields replaced with the new values.
  WxBadgeThemeData merge(WxBadgeThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      animated: other.animated,
      curve: other.curve,
      curveOut: other.curveOut,
      duration: other.duration,
      durationOut: other.durationOut,
      position: other.position,
      offset: other.offset,
      style: other.style,
    );
  }

  @override
  WxBadgeThemeData lerp(ThemeExtension<WxBadgeThemeData>? other, double t) {
    if (other is! WxBadgeThemeData) return this;
    return WxBadgeThemeData(
      animated: lerpBool(animated, other.animated, t) ?? animated,
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      curveOut: lerpEnum(curveOut, other.curveOut, t) ?? curveOut,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      durationOut: lerpEnum(durationOut, other.durationOut, t) ?? durationOut,
      position: AlignmentGeometry.lerp(position, other.position, t) ?? position,
      offset: Offset.lerp(offset, other.offset, t) ?? offset,
      style: WxBadgeStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {
        'animated': animated,
        'curve': curve,
        'curveOut': curveOut,
        'duration': duration,
        'durationOut': durationOut,
        'position': position,
        'offset': offset,
        'style': style,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxBadgeThemeData && mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => Object.hashAll(toMap().values);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    toMap().entries.forEach((el) {
      properties.add(DiagnosticsProperty(el.key, el.value, defaultValue: null));
    });
  }
}
