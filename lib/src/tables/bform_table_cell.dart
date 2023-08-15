import 'package:flutter/material.dart';

class BformTableCell extends StatelessWidget {
  final Widget child;
  final Color? color;
  const BformTableCell({super.key, required this.child, this.color = Colors.black12});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.all(5),
      color: color,
      alignment: Alignment.center,
      child: child,
    );
  }
}
