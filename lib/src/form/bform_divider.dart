import 'package:flutter/material.dart';

class BformDivider extends StatelessWidget {
  final Widget? child;
  final bool vertical;
  final Color? color;
  const BformDivider({
    super.key,
    this.child,
    this.vertical = false,
    this.color,
  });

  Widget _divider() {
    return Expanded(
      child: Divider(
        color: color,
        thickness: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      children: <Widget>[
        _divider(),
        child ?? const SizedBox(),
        _divider(),
      ],
    );
  }
}
