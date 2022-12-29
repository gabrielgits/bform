import 'package:bform/bform.dart';
import 'package:flutter/material.dart';

class BformButton extends StatelessWidget {
  final Widget child;
  final BformAppearance? appearance;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Color color;
  final double? width;
  final double? height;
  final double padding;
  final BoxBorder? border;

  const BformButton({
    Key? key,
    required this.child,
    this.appearance,
    this.onPressed,
    this.onLongPress,
    this.color = Colors.white,
    this.width,
    this.height,
    this.padding = 10,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onDoubleTap: onLongPress,
      child: Container(
        decoration: decoration(),
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }

  Decoration decoration() {
    if (appearance == BformAppearance.soft) {
      return BoxDecoration(
        color: color,
        border: border,
        shape: BoxShape.circle,
      );
    } else if (appearance == BformAppearance.business) {
      return BoxDecoration(color: color, border: border);
    } else if (appearance == BformAppearance.sky) {
      return BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(blurRadius: 1)],
      );
    }
    return BoxDecoration(
      color: color,
      border: border,
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [BoxShadow(blurRadius: 5)],
    );
  }
}
