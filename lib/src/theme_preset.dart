import 'package:flutter/widgets.dart';
import 'theme_data.dart';

@immutable
class BadgeThemeDefaults extends WxBadgeThemeData {
  BadgeThemeDefaults(
    this.context, [
    WxBadgeThemeData? other,
  ]) : super.from(other);

  final BuildContext context;
}
