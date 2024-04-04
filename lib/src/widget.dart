import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:wx_box/wx_box.dart';
import 'layout.dart';
import 'transition.dart';
import 'style.dart';
import 'theme.dart';

/// Display element at the corner of another element
class WxBadge extends StatelessWidget {
  /// Create a badge widget
  const WxBadge({
    super.key,
    this.duration,
    this.curve,
    this.transition = WxBadgeTransition.scale,
    this.layout = WxBadgeLayout.defaults,
    this.hidden = false,
    this.position,
    this.offset,
    this.style,
    this.content,
    required this.child,
  });

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  /// A function that wraps a new [content] with an animation that transitions the [content] in when the animation runs in the forward direction and out when the animation runs in the reverse direction. This is only called when a new [content] is set (not for each build), or when a new [transition] is set. If a new [transition] is set, then the transition is rebuilt for the current content and all previous children using the new [transition]. The function must not return null.
  final WxBadgeTransitionBuilder transition;

  /// A function that wraps all of the children that are transitioning out, and the [child] that's transitioning in, with a widget that lays all of them out. This is called every time this widget is built. The function must not return null.
  final WxBadgeLayoutBuilder layout;

  /// Whether or not this badge is hidden.
  ///
  /// Must not be null. Defaults to false.
  final bool hidden;

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
    final effectiveDuration = duration ?? badgeTheme.duration;

    Widget badge = SizedBox.shrink(
      key: ValueKey(content),
    );

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
      badge = WxBox(
        key: ValueKey(content),
        width: badgeStyle.width,
        height: badgeStyle.height,
        constraints: badgeStyle.constraints,
        clipBehavior: badgeStyle.clipBehavior,
        shadowColor: badgeStyle.shadowColor,
        elevation: badgeStyle.elevation,
        color: badgeStyle.effectiveBackgroundColor,
        borderColor: badgeStyle.effectiveBorderColor,
        borderWidth: badgeStyle.borderWidth,
        borderStyle: badgeStyle.borderStyle,
        borderRadius: badgeStyle.borderRadius,
        borderAlign: badgeStyle.borderAlign,
        shape: badgeStyle.effectiveShape,
        padding: badgeStyle.padding,
        child: effectiveContent,
      );
    }

    // build animation
    badge = AnimatedSwitcher(
      duration: effectiveDuration,
      switchInCurve: effectiveCurve,
      switchOutCurve: effectiveCurve,
      transitionBuilder: transition,
      layoutBuilder: layout,
      child: badge,
    );

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
    properties.add(DiagnosticsProperty<Duration?>('duration', duration));
    properties.add(DiagnosticsProperty<bool>('hidden', hidden));
    properties
        .add(DiagnosticsProperty<AlignmentGeometry?>('alignment', position));
    properties.add(DiagnosticsProperty<Offset?>('offset', offset));
    properties.add(DiagnosticsProperty<WxBadgeStyle?>('style', style));
  }
}
