import 'package:bform/bform.dart';
import 'package:flutter/material.dart';

class BformForm extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final Color? color;
  final Color? colorTitle;
  final double width;
  final double? height;
  final double padding;
  final BoxBorder? border;
  final BoxBorder? borderTitle;
  final DecorationImage? background;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final BformAppearance? appearance;

  const BformForm({
    Key? key,
    required this.child,
    this.title,
    this.color,
    this.colorTitle = Colors.white,
    this.width = 300,
    this.height,
    this.padding = 10,
    this.border,
    this.borderTitle,
    this.background,
    this.onPressed,
    this.onLongPress,
    this.appearance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: SingleChildScrollView(
            child: Container(
              width: width,
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
              decoration: decoration(),
              child: Column(
                children: [
                  SizedBox(height: title != null ? 30 : 0),
                  child,
                ],
              ),
            ),
          ),
        ),
        if (title != null) formTitle(),
      ],
    );
  }

  Widget formTitle() {
    if (appearance == BformAppearance.soft) {
      return Positioned(
        left: 10,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: colorTitle,
            border: borderTitle,
          ),
          child: title,
        ),
      );
    } else if (appearance == BformAppearance.business) {
      return Positioned(
        left: 20,
        top: 10,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: colorTitle,
            border: borderTitle,
          ),
          child: title,
        ),
      );
    } else if (appearance == BformAppearance.sky) {
      return Positioned(
        left: 20,
        top: 10,
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            color: colorTitle,
            border: borderTitle,
            boxShadow: const [BoxShadow(blurRadius: 2)],
          ),
          child: title,
        ),
      );
    }
    return Positioned(
      left: 20,
      top: 10,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: colorTitle,
          border: borderTitle,
          borderRadius: BorderRadius.circular(8),
        ),
        child: title,
      ),
    );
  }

  BoxDecoration decoration() {
    if (appearance == BformAppearance.soft) {
      return BoxDecoration(
        color: color,
        border: border,
        image: background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        //borderRadius: BorderRadius.circular(10),
        //boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.black12)],
      );
    } else if (appearance == BformAppearance.business) {
      return BoxDecoration(
        color: color,
        border: border,
        image: background,
        //borderRadius: BorderRadius.circular(8),
        // boxShadow: const [BoxShadow(blurRadius: 2)],
      );
    } else if (appearance == BformAppearance.sky) {
      return BoxDecoration(
        color: color,
        border: border,
        image: background,
        borderRadius: BorderRadius.circular(16),
        //boxShadow: const [BoxShadow(blurRadius: 2)],
      );
    }
    return BoxDecoration(
      color: color,
      border: border,
      image: background,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
