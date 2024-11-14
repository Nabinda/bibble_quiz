import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ResponsiveHelper on BuildContext {
  /// Returns same as MediaQuery.of(context)
  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns same as MediaQuery.of(context).size
  Size get sizePx => mq.size;

  /// Returns ratio of device
  double get ratio => mq.size.aspectRatio;

  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;

  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  /// Returns fraction (0-1) of screen width in pixels
  double widthPct(double fraction) => fraction * widthPx;

  /// Returns fraction (0-1) of screen height in pixels
  double heightPct(double fraction) => fraction * heightPx;

  /// Returns if device is mobile
  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;

  /// Returns if device size is greater than mobile
  bool get isGreaterThanMobile =>
      ResponsiveBreakpoints.of(this).largerThan(MOBILE);

  /// Returns if device size is greater than mobile
  bool get isGreaterThanTablet =>
      ResponsiveBreakpoints.of(this).largerThan(TABLET);

  double get regularHorizontalPadding =>
      responsiveValue(mobileValue: 16, tabletValue: 24);

  /// Returns the responsive as defined
  T responsiveValue<T>(
          {T? defaultValue, T? mobileValue, T? tabletValue, T? desktopValue}) =>
      ResponsiveValue<T>(this,
          defaultValue: defaultValue ?? tabletValue,
          conditionalValues: [
            Condition.equals(name: MOBILE, value: mobileValue),
            Condition.equals(name: TABLET, value: tabletValue),
            Condition.largerThan(name: TABLET, value: desktopValue),
          ]).value;
}
