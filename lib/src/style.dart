import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:wx_utils/wx_utils.dart';

/// The style to be applied to badge widget
@immutable
class WxBadgeStyle with Diagnosticable {
  /// Create a raw badge's style
  const WxBadgeStyle({
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.shadows,
    this.border,
    this.padding,
    this.clipBehavior,
    this.elevationColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundSize,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.backgroundImage,
    this.backgroundGradient,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderOffset,
    this.borderStyle,
    this.borderRadius,
  });

  /// Create an badge's style with square shape
  const WxBadgeStyle.square({
    double? size,
    double? minSize,
    double? maxSize,
    this.shadows,
    this.padding,
    this.clipBehavior,
    this.elevationColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundSize,
    this.backgroundImage,
    this.backgroundGradient,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.border,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderOffset,
    this.borderStyle,
    this.borderRadius,
  })  : width = size,
        height = size,
        minWidth = minSize,
        maxWidth = maxSize,
        minHeight = minSize,
        maxHeight = maxSize;

  /// Create an badge's style with circle shape
  const WxBadgeStyle.circle({
    double? radius,
    double? minRadius,
    double? maxRadius,
    this.shadows,
    this.padding,
    this.clipBehavior,
    this.elevationColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundSize,
    this.backgroundImage,
    this.backgroundGradient,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderOffset,
    this.borderStyle,
  })  : border = const CircleBorder(),
        borderRadius = null,
        width = radius != null ? radius * 2 : null,
        height = radius != null ? radius * 2 : null,
        minWidth = minRadius != null ? minRadius * 2 : null,
        maxWidth = maxRadius != null ? maxRadius * 2 : null,
        minHeight = minRadius != null ? minRadius * 2 : null,
        maxHeight = maxRadius != null ? maxRadius * 2 : null;

  /// Create a raw badge's style with stadium shape
  const WxBadgeStyle.stadium({
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.shadows,
    this.padding,
    this.clipBehavior,
    this.elevationColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundSize,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.backgroundImage,
    this.backgroundGradient,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderOffset,
    this.borderStyle,
  })  : border = const StadiumBorder(),
        borderRadius = null;

  /// Create a badge's style from another style
  WxBadgeStyle.from(WxBadgeStyle? other)
      : width = other?.width,
        height = other?.height,
        minWidth = other?.minWidth,
        maxWidth = other?.maxWidth,
        minHeight = other?.minHeight,
        maxHeight = other?.maxHeight,
        shadows = other?.shadows,
        border = other?.border,
        padding = other?.padding,
        clipBehavior = other?.clipBehavior,
        elevationColor = other?.elevationColor,
        elevation = other?.elevation,
        foregroundStyle = other?.foregroundStyle,
        foregroundSize = other?.foregroundSize,
        foregroundColor = other?.foregroundColor,
        foregroundOpacity = other?.foregroundOpacity,
        foregroundAlpha = other?.foregroundAlpha,
        backgroundImage = other?.backgroundImage,
        backgroundGradient = other?.backgroundGradient,
        backgroundColor = other?.backgroundColor,
        backgroundOpacity = other?.backgroundOpacity,
        backgroundAlpha = other?.backgroundAlpha,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderOffset = other?.borderOffset,
        borderStyle = other?.borderStyle,
        borderRadius = other?.borderRadius;

  /// An [WxBadgeStyle] with some reasonable default values.
  static const defaults = WxBadgeStyle(
    border: RoundedRectangleBorder(),
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderWidth: 2.0,
    borderStyle: BorderStyle.none,
    borderOffset: BorderSide.strokeAlignOutside,
    foregroundSize: 11,
  );

  /// The type of badge's shape.
  final OutlinedBorder? border;

  /// The amount of space by which to inset the badge content.
  final EdgeInsetsGeometry? padding;

  /// The horizontal extent of the badge widget.
  final double? width;

  /// The vertical extent of the badge widget.
  final double? height;

  /// The minimum width of the badge
  final double? minWidth;

  /// The maximum width of the badge
  final double? maxWidth;

  /// The minimum height of the badge
  final double? minHeight;

  /// The maximum height of the badge
  final double? maxHeight;

  /// A list of shadows cast by the [border].
  final List<BoxShadow>? shadows;

  /// The badge's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  final Clip? clipBehavior;

  /// When [elevation] is non zero the color to use for the badge's shadow color.
  final Color? elevationColor;

  /// The badge's z-coordinate relative to the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

  /// The style to be applied to the badge's label.
  ///
  /// The default label style is [TextTheme.titleMedium] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? foregroundStyle;

  /// Size to be apply to the Text or Icon.
  final double? foregroundSize;

  /// The color to be applied to the badge's label, icon, and checkmark
  final Color? foregroundColor;

  /// Opacity to be apply to [foregroundColor].
  final double? foregroundOpacity;

  /// Alpha to be apply to [foregroundColor].
  final int? foregroundAlpha;

  /// An image to paint inside the shape (clipped to its outline).
  ///
  /// The image is drawn over the [backgroundColor] or [backgroundGradient].
  final DecorationImage? backgroundImage;

  /// A gradient to use when filling the shape.
  ///
  /// The gradient is under the [backgroundImage].
  ///
  /// If a [backgroundColor] is specified, [backgroundGradient] must be null.
  final Gradient? backgroundGradient;

  /// Color to be used for the badge's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the badge's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the badge's border, in logical pixels.
  final double? borderWidth;

  /// The relative position of the stroke on a [BorderSide] in an
  /// [OutlinedBorder] or [Border].
  final double? borderOffset;

  /// The style of this side of the badge's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// The radii for each corner of the badge's border.
  final BorderRadius? borderRadius;

  /// constraints to apply to the badge
  BoxConstraints? get constraints => minWidth != null ||
          minHeight != null ||
          maxWidth != null ||
          maxHeight != null
      ? BoxConstraints(
          minHeight: minHeight ?? 0,
          minWidth: minWidth ?? 0,
          maxWidth: maxWidth ?? double.infinity,
          maxHeight: maxHeight ?? double.infinity,
        )
      : null;

  /// If [border] is `null`, then fallback to default value
  OutlinedBorder get effectiveShape => border ?? defaults.border!;

  /// Computed background color with opacity and alpha
  Color? get effectiveBackgroundColor {
    return backgroundGradient == null
        ? backgroundColor != null
            ? WxColors.withTransparency(
                backgroundColor!,
                opacity: backgroundOpacity,
                alpha: backgroundAlpha,
              )
            : null
        : null;
  }

  /// Computed border color with opacity and alpha
  Color? get effectiveBorderColor {
    return borderColor != null
        ? WxColors.withTransparency(
            borderColor!,
            opacity: borderOpacity,
            alpha: borderAlpha,
          )
        : null;
  }

  /// Computed foreground color with opacity and alpha
  Color? get effectiveForegroundColor {
    return foregroundColor != null
        ? WxColors.withTransparency(
            foregroundColor!,
            opacity: foregroundOpacity,
            alpha: foregroundAlpha,
          )
        : WxColors.onSurface(backgroundColor);
  }

  /// Computed foreground text style with foreground color
  TextStyle get effectiveForegroundStyle {
    return const TextStyle().merge(foregroundStyle).copyWith(
          color: foregroundColor,
          fontSize: foregroundSize,
        );
  }

  /// Creates a copy of this [WxBadgeStyle] but with
  /// the given fields replaced with the new values.
  WxBadgeStyle copyWith({
    double? width,
    double? height,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
    OutlinedBorder? border,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? elevationColor,
    double? elevation,
    List<BoxShadow>? shadows,
    TextStyle? foregroundStyle,
    double? foregroundSize,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    DecorationImage? backgroundImage,
    Gradient? backgroundGradient,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    double? borderOffset,
    BorderStyle? borderStyle,
    BorderRadius? borderRadius,
  }) {
    return WxBadgeStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      minWidth: minWidth ?? this.minWidth,
      maxWidth: maxWidth ?? this.maxWidth,
      minHeight: minHeight ?? this.minHeight,
      maxHeight: maxHeight ?? this.maxHeight,
      border: border ?? this.border,
      padding: padding ?? this.padding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      elevationColor: elevationColor ?? this.elevationColor,
      elevation: elevation ?? this.elevation,
      shadows: shadows ?? this.shadows,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundSize: foregroundSize ?? this.foregroundSize,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderOffset: borderOffset ?? this.borderOffset,
      borderStyle: borderStyle ?? this.borderStyle,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Creates a copy of this [WxBadgeStyle] but with
  /// the given fields replaced with the new values.
  WxBadgeStyle merge(WxBadgeStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      width: other.width,
      height: other.height,
      minWidth: other.minWidth,
      maxWidth: other.maxWidth,
      minHeight: other.minHeight,
      maxHeight: other.maxHeight,
      border: other.border,
      padding: other.padding,
      clipBehavior: other.clipBehavior,
      elevationColor: other.elevationColor,
      elevation: other.elevation,
      shadows: other.shadows,
      foregroundStyle: other.foregroundStyle,
      foregroundSize: other.foregroundSize,
      foregroundColor: other.foregroundColor,
      foregroundOpacity: other.foregroundOpacity,
      foregroundAlpha: other.foregroundAlpha,
      backgroundImage: other.backgroundImage,
      backgroundGradient: other.backgroundGradient,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderOffset: other.borderOffset,
      borderStyle: other.borderStyle,
      borderRadius: other.borderRadius,
    );
  }

  /// Linearly interpolate between two icon theme data objects.
  static WxBadgeStyle? lerp(WxBadgeStyle? a, WxBadgeStyle? b, double t) {
    if (a == null && b == null) return null;
    return WxBadgeStyle(
      width: lerpDouble(a?.width, b?.width, t),
      height: lerpDouble(a?.height, b?.height, t),
      minWidth: lerpDouble(a?.minWidth, b?.minWidth, t),
      maxWidth: lerpDouble(a?.maxWidth, b?.maxWidth, t),
      minHeight: lerpDouble(a?.minHeight, b?.minHeight, t),
      maxHeight: lerpDouble(a?.maxHeight, b?.maxHeight, t),
      border: OutlinedBorder.lerp(a?.border, b?.border, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      clipBehavior: t < 0.5 ? a?.clipBehavior : b?.clipBehavior,
      elevationColor: Color.lerp(a?.elevationColor, b?.elevationColor, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      shadows: BoxShadow.lerpList(a?.shadows, b?.shadows, t),
      foregroundStyle:
          TextStyle.lerp(a?.foregroundStyle, b?.foregroundStyle, t),
      foregroundSize: lerpDouble(a?.foregroundSize, b?.foregroundSize, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      foregroundOpacity:
          lerpDouble(a?.foregroundOpacity, b?.foregroundOpacity, t),
      foregroundAlpha: lerpInt(a?.foregroundAlpha, b?.foregroundAlpha, t),
      backgroundImage:
          DecorationImage.lerp(a?.backgroundImage, b?.backgroundImage, t),
      backgroundGradient:
          Gradient.lerp(a?.backgroundGradient, b?.backgroundGradient, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      backgroundOpacity:
          lerpDouble(a?.backgroundOpacity, b?.backgroundOpacity, t),
      backgroundAlpha: lerpInt(a?.backgroundAlpha, b?.backgroundAlpha, t),
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      borderOpacity: lerpDouble(a?.borderOpacity, b?.borderOpacity, t),
      borderAlpha: lerpInt(a?.borderAlpha, b?.borderAlpha, t),
      borderWidth: lerpDouble(a?.borderWidth, b?.borderWidth, t),
      borderOffset: lerpDouble(a?.borderOffset, b?.borderOffset, t),
      borderStyle: t < 0.5 ? a?.borderStyle : b?.borderStyle,
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'width': width,
        'height': height,
        'minWidth': minWidth,
        'maxWidth': maxWidth,
        'minHeight': minHeight,
        'maxHeight': maxHeight,
        'shadows': shadows,
        'border': border,
        'padding': padding,
        'clipBehavior': clipBehavior,
        'elevationColor': elevationColor,
        'elevation': elevation,
        'foregroundStyle': foregroundStyle,
        'foregroundSize': foregroundSize,
        'foregroundColor': foregroundColor,
        'foregroundOpacity': foregroundOpacity,
        'foregroundAlpha': foregroundAlpha,
        'backgroundImage': backgroundImage,
        'backgroundGradient': backgroundGradient,
        'backgroundColor': backgroundColor,
        'backgroundOpacity': backgroundOpacity,
        'backgroundAlpha': backgroundAlpha,
        'borderColor': borderColor,
        'borderOpacity': borderOpacity,
        'borderAlpha': borderAlpha,
        'borderWidth': borderWidth,
        'borderOffset': borderOffset,
        'borderStyle': borderStyle,
        'borderRadius': borderRadius,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is WxBadgeStyle && mapEquals(other.toMap(), toMap());
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
