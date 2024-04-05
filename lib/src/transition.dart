import 'package:flutter/widgets.dart';
import 'dart:math';

typedef WxBadgeTransitionBuilder = AnimatedSwitcherTransitionBuilder;

abstract class WxBadgeTransition {
  /// The new child is given a [FadeTransition] which increases opacity as
  /// the animation goes from 0.0 to 1.0, and decreases when the animation is reversed.
  static const fade = AnimatedSwitcher.defaultTransitionBuilder;

  /// The new child is given a [ScaleTransition] which increases scale as
  /// the animation goes from 0.0 to 1.0, and decreases when the animation is reversed.
  static const zoomIn = _zoomIn;
  static Widget _zoomIn(Widget child, Animation<double> animation) {
    return zoom(0, 1)(child, animation);
  }

  /// The new child is given a [ScaleTransition] which decrease scale as
  /// the animation goes from 2.0 to 1.0, and increase when the animation is reversed.
  static const zoomOut = _zoomOut;
  static Widget _zoomOut(Widget child, Animation<double> animation) {
    return zoom(2, 1, withFade: true)(child, animation);
  }

  static const slideTop = _slideTop;
  static Widget _slideTop(Widget child, Animation<double> animation) {
    return slide(0)(child, animation);
  }

  static const slideTopLeft = _slideTopLeft;
  static Widget _slideTopLeft(Widget child, Animation<double> animation) {
    return slide(-45)(child, animation);
  }

  static const slideTopRight = _slideTopRight;
  static Widget _slideTopRight(Widget child, Animation<double> animation) {
    return slide(45)(child, animation);
  }

  static const slideRight = _slideRight;
  static Widget _slideRight(Widget child, Animation<double> animation) {
    return slide(90)(child, animation);
  }

  static const slideBottom = _slideBottom;
  static Widget _slideBottom(Widget child, Animation<double> animation) {
    return slide(180)(child, animation);
  }

  static const slideBottomLeft = _slideBottomLeft;
  static Widget _slideBottomLeft(Widget child, Animation<double> animation) {
    return slide(225)(child, animation);
  }

  static const slideBottomRight = _slideBottomRight;
  static Widget _slideBottomRight(Widget child, Animation<double> animation) {
    return slide(135)(child, animation);
  }

  static const slideLeft = _slideLeft;
  static Widget _slideLeft(Widget child, Animation<double> animation) {
    return slide(-90)(child, animation);
  }

  static const flipX = _flipX;
  static Widget _flipX(Widget child, Animation<double> animation) {
    return flip(Axis.horizontal)(child, animation);
  }

  static const flipY = _flipY;
  static Widget _flipY(Widget child, Animation<double> animation) {
    return flip(Axis.vertical)(child, animation);
  }

  /// The transition builder used as the default value of [transitionBuilder].
  ///
  /// The new child is given a [FadeTransition] which increases opacity as
  /// the animation goes from 0.0 to 1.0, and decreases when the animation is
  /// reversed.
  ///
  /// This is an [AnimatedSwitcherTransitionBuilder] function.
  static AnimatedSwitcherTransitionBuilder rotate({
    double scaleFactor = 1,
    bool clockwise = true,
    bool withFade = true,
  }) {
    return (child, final animation) {
      final tween = Tween<double>(
        begin: 0.0,
        end: clockwise ? 1.0 : -1.0,
      );

      if (withFade) {
        child = fade(child, animation);
      }

      if (scaleFactor != 1) {
        child = zoom(scaleFactor, 1)(child, animation);
      }

      return RotationTransition(
        key: ValueKey<Key?>(child.key),
        turns: tween.animate(animation),
        child: child,
      );
    };
  }

  /// The new child is given a [ScaleTransition] which decrease scale as
  /// the animation goes from 2.0 to 1.0, and increase when the animation is reversed.
  static AnimatedSwitcherTransitionBuilder zoom(
    double scaleInFactor,
    double scaleOutFactor, {
    bool withFade = false,
  }) {
    return (child, final animation) {
      final isReversed = animation.status == AnimationStatus.reverse;
      final tween = Tween<double>(
        begin: isReversed ? scaleOutFactor : scaleInFactor,
        end: 1.0,
      );

      if (withFade) {
        child = fade(child, animation);
      }

      return ScaleTransition(
        key: ValueKey(child.key),
        scale: tween.animate(animation),
        child: child,
      );
    };
  }

  static AnimatedSwitcherTransitionBuilder slide(
    double direction, {
    double distance = 1,
    double scaleFactor = 1,
    bool withFade = true,
  }) {
    return (child, final animation) {
      final isReversed = animation.status == AnimationStatus.reverse;
      final directionRadians = getRadiansFromDegrees(direction - 90);
      final offset = Offset.fromDirection(directionRadians, distance);
      final tween = Tween<Offset>(
        begin: isReversed ? -offset : offset,
        end: Offset.zero,
      );

      if (withFade) {
        child = fade(child, animation);
      }

      if (scaleFactor != 1) {
        child = zoom(scaleFactor, 1)(child, animation);
      }

      return SlideTransition(
        position: tween.animate(animation),
        child: child,
      );
    };
  }

  static AnimatedSwitcherTransitionBuilder flip([
    Axis direction = Axis.horizontal,
  ]) {
    return (child, final animation) {
      final rotation = Tween(begin: pi, end: 0.0).animate(animation);
      return AnimatedBuilder(
        animation: rotation,
        child: child,
        builder: (context, child) {
          final isReversed = animation.status == AnimationStatus.reverse;
          double tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
          tilt *= isReversed ? -1.0 : 1.0;
          final transform = Matrix4.identity()..setEntry(3, 0, tilt);
          final value =
              isReversed ? min(rotation.value, pi / 2) : rotation.value;
          if (direction == Axis.horizontal) {
            transform.rotateY(value);
          } else {
            transform.rotateX(value);
          }
          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: child,
          );
        },
      );
    };
  }
}

double getRadiansFromDegrees(double degrees) {
  return degrees * pi / 180;
}
