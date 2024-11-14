import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final String icon;
  final double? size;
  final double? height;
  final double? width;
  const AppIcon(
      {super.key, required this.icon, this.size, this.height, this.width})
      : assert(
            (size != null && height == null && width == null) ||
                (size == null && height == null && width == null) ||
                (size == null && height != null && width != null),
            'If size is provided, height and width should be null. If size is null, both height and width should be either null or non-null.');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? height ?? 34,
      width: size ?? width ?? 34,
      child: Image.asset(
        icon,
        height: size ?? height,
        width: size ?? width,
      ),
    );
  }
}
