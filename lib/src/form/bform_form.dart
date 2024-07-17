import 'package:flutter/material.dart';

class BformForm extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? width;
  final double? height;
  final double? padding;
  final Color? background;
  final BoxBorder? border;

  const BformForm({
    Key? key,
    required this.child,
    this.color,
    this.width,
    this.border,
    this.background,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding ?? 10),
      decoration: decoration(),
      child: SingleChildScrollView(child: child),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: background,
      border: border,
      borderRadius: BorderRadius.circular(8),
      boxShadow:
          (color != null) ? [BoxShadow(blurRadius: 8, color: color!)] : null,
    );
  }
}
