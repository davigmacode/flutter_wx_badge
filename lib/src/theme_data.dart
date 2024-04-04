import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wx_utils/wx_utils.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [Badge].
///
/// Descendant widgets obtain the current [WxBadgeThemeData] object using
/// `BadgeTheme.of(context)`. Instances of [WxBadgeThemeData]
/// can be customized with [WxBadgeThemeData.copyWith] or [WxBadgeThemeData.merge].
@immutable
class WxBadgeThemeData extends ThemeExtension<WxBadgeThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of badge widget.
  final Curve curve;

  /// The duration over which to animate the parameters of badge widget.
  final Duration duration;

  /// Align the badge content within the child.
  final AlignmentGeometry position;

  /// Offset of the badge content
  final Offset offset;

  /// The [WxBadgeStyle] to be applied to the badge widget
  final WxBadgeStyle style;

  /// Creates a theme data that can be used for [BadgeTheme].
  const WxBadgeThemeData({
    required this.curve,
    required this.duration,
    required this.position,
    required this.offset,
    required this.style,
  });

  /// An [WxBadgeThemeData] with some reasonable default values.
  static const fallback = WxBadgeThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    position: Alignment.topRight,
    offset: Offset.zero,
    style: WxBadgeStyle.defaults,
  );

  /// Creates a [WxBadgeThemeData] from another one that probably null.
  WxBadgeThemeData.from([WxBadgeThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        position = other?.position ?? fallback.position,
        offset = other?.offset ?? fallback.offset,
        style = other?.style ?? fallback.style;

  /// A [WxBadgeThemeData] with default values.
  factory WxBadgeThemeData.defaults(BuildContext context) =>
      BadgeThemeDefaults(context);

  /// Creates a copy of this [WxBadgeThemeData] but with
  /// the given fields replaced with the new values.
  @override
  WxBadgeThemeData copyWith({
    Curve? curve,
    Duration? duration,
    AlignmentGeometry? position,
    Offset? offset,
    WxBadgeStyle? style,
  }) {
    return WxBadgeThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
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
      curve: other.curve,
      duration: other.duration,
      position: other.position,
      offset: other.offset,
      style: other.style,
    );
  }

  @override
  WxBadgeThemeData lerp(ThemeExtension<WxBadgeThemeData>? other, double t) {
    if (other is! WxBadgeThemeData) return this;
    return WxBadgeThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      position: AlignmentGeometry.lerp(position, other.position, t) ?? position,
      offset: Offset.lerp(offset, other.offset, t) ?? offset,
      style: WxBadgeStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
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
