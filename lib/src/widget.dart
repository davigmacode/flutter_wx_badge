import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:wx_box/wx_box.dart';
import 'style.dart';
import 'theme.dart';

/// Display element at the corner of another element
class WxBadge extends StatelessWidget {
  /// Create a badge widget
  const WxBadge({
    super.key,
    this.hidden = false,
    this.animated,
    this.duration,
    this.durationOut,
    this.curve,
    this.curveOut,
    this.transition,
    this.layout = AnimatedSwitcher.defaultLayoutBuilder,
    this.position,
    this.offset,
    this.style,
    this.content,
    required this.child,
  });

  /// Whether to animate the badge decoration.
  final bool? animated;

  /// Whether or not this badge is hidden.
  ///
  /// Must not be null. Defaults to false.
  final bool hidden;

  /// The animation curve to use when transitioning in a new [content].
  final Curve? curve;

  /// The animation curve to use when transitioning a previous [content] out.
  final Curve? curveOut;

  /// The duration of the transition from the old [content] value to the new one.
  final Duration? duration;

  /// The duration of the transition from the new [content] value to the old one.
  final Duration? durationOut;

  /// A function that wraps a new [content] with an animation that transitions the [content] in when the animation runs in the forward direction and out when the animation runs in the reverse direction. This is only called when a new [content] is set (not for each build), or when a new [transition] is set. If a new [transition] is set, then the transition is rebuilt for the current content and all previous children using the new [transition]. The function must not return null.
  final AnimatedSwitcherTransitionBuilder? transition;

  /// A function that wraps all of the children that are transitioning out, and the [child] that's transitioning in, with a widget that lays all of them out. This is called every time this widget is built. The function must not return null.
  final AnimatedSwitcherLayoutBuilder layout;

  /// How to align the badge with the [child].
  final AlignmentGeometry? position;

  /// Translate the badge with this offset.
  final Offset? offset;

  /// The style to be applied to the badge.
  final WxBadgeStyle? style;

  ///  The primary content of the badge.
  final Widget? content;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Indicates this badge is visible
  bool get visible => !hidden;

  @override
  Widget build(BuildContext context) {
    final badgeTheme = WxBadgeTheme.of(context);
    final badgeStyle = badgeTheme.style.merge(style);
    final effectivePosition = position ?? badgeTheme.position;
    final effectiveOffset = offset ?? badgeTheme.offset;
    final effectiveCurve = curve ?? badgeTheme.curve;
    final effectiveCurveOut = curveOut ?? badgeTheme.curveOut ?? effectiveCurve;
    final effectiveDuration = duration ?? badgeTheme.duration;
    final effectiveDurationOut = durationOut ?? badgeTheme.durationOut;
    final effectiveAnimated = animated ?? badgeTheme.animated;

    Widget badge = const SizedBox.shrink();

    if (visible) {
      Widget? effectiveContent;
      if (content != null) {
        effectiveContent = MediaQuery.withNoTextScaling(
          child: DefaultTextStyle(
            style: badgeStyle.effectiveForegroundStyle,
            child: IconTheme.merge(
              data: IconThemeData(
                color: badgeStyle.effectiveForegroundColor,
                size: badgeStyle.foregroundSize,
              ),
              child: content!,
            ),
          ),
        );
      }

      // create shape with its decoration
      if (effectiveAnimated) {
        badge = WxAnimatedBox(
          key: content?.key,
          width: badgeStyle.width,
          height: badgeStyle.height,
          constraints: badgeStyle.constraints,
          clipBehavior: badgeStyle.clipBehavior,
          elevationColor: badgeStyle.elevationColor,
          elevation: badgeStyle.elevation,
          color: badgeStyle.effectiveBackgroundColor,
          borderColor: badgeStyle.effectiveBorderColor,
          borderWidth: badgeStyle.borderWidth,
          borderStyle: badgeStyle.borderStyle,
          borderRadius: badgeStyle.borderRadius,
          borderOffset: badgeStyle.borderOffset,
          border: badgeStyle.effectiveShape,
          padding: badgeStyle.padding,
          image: badgeStyle.backgroundImage,
          shadows: badgeStyle.shadows,
          gradient: badgeStyle.backgroundGradient,
          child: effectiveContent,
        );
      } else {
        badge = WxBox(
          key: content?.key,
          width: badgeStyle.width,
          height: badgeStyle.height,
          constraints: badgeStyle.constraints,
          clipBehavior: badgeStyle.clipBehavior,
          elevationColor: badgeStyle.elevationColor,
          elevation: badgeStyle.elevation,
          color: badgeStyle.effectiveBackgroundColor,
          borderColor: badgeStyle.effectiveBorderColor,
          borderWidth: badgeStyle.borderWidth,
          borderStyle: badgeStyle.borderStyle,
          borderRadius: badgeStyle.borderRadius,
          borderOffset: badgeStyle.borderOffset,
          border: badgeStyle.effectiveShape,
          padding: badgeStyle.padding,
          image: badgeStyle.backgroundImage,
          shadows: badgeStyle.shadows,
          gradient: badgeStyle.backgroundGradient,
          child: effectiveContent,
        );
      }
    }

    // build animation
    if (transition != null) {
      badge = AnimatedSwitcher(
        duration: effectiveDuration,
        reverseDuration: effectiveDurationOut,
        switchInCurve: effectiveCurve,
        switchOutCurve: effectiveCurveOut,
        transitionBuilder: transition!,
        layoutBuilder: layout,
        child: badge,
      );
    }

    // position the badge
    badge = Positioned(
      child: Transform.translate(
        offset: effectiveOffset,
        child: badge,
      ),
    );

    return Stack(
      alignment: effectivePosition,
      clipBehavior: Clip.none,
      children: <Widget>[
        child,
        badge,
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Curve?>('curve', curve));
    properties.add(DiagnosticsProperty<Curve?>('curveOut', curveOut));
    properties.add(DiagnosticsProperty<Duration?>('duration', duration));
    properties.add(DiagnosticsProperty<Duration?>('durationOut', durationOut));
    properties.add(DiagnosticsProperty<bool>('hidden', hidden));
    properties
        .add(DiagnosticsProperty<AlignmentGeometry?>('alignment', position));
    properties.add(DiagnosticsProperty<Offset?>('offset', offset));
    properties.add(DiagnosticsProperty<WxBadgeStyle?>('style', style));
  }
}
