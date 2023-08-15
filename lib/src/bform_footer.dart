import 'package:flutter/material.dart';

class BformFooter extends StatelessWidget {
  final Widget? leftChild;
  final Widget middleChild;
  final Widget? rightChild;
  const BformFooter({
    super.key,
    this.leftChild,
    required this.middleChild,
    this.rightChild,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        leftChild ?? const SizedBox(),
        middleChild,
        rightChild ?? const SizedBox(),
      ]),
    );
  }
}
