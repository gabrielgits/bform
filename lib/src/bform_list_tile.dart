import 'package:bform/bform.dart';
import 'package:flutter/material.dart';

class BformListTile extends StatelessWidget {
  final IBformModel item;
  final Color color;
  final BoxBorder? border;
  final BformAppearance? appearance;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final DecorationImage? background;
  final double padding;

  const BformListTile({
    Key? key,
    this.appearance,
    this.onPressed,
    this.onLongPress,
    required this.item,
    this.border,
    this.background,
    this.color = Colors.white54,
    this.padding  = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onDoubleTap: onLongPress,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: decoration(),
        child: ListTile(
          leading: item.imagePath.length > 1
              ? Image(image: AssetImage(item.imagePath))
              : null,
          title: Text(
            item.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            item.subtitle,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: item.selectId != 0
              ? Text(
                  item.selectId.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontStyle: FontStyle.italic),
                )
              : null,
        ),
      ),
    );
  }

  BoxDecoration decoration() {
    if (appearance == BformAppearance.soft) {
      return BoxDecoration(
        border: border,
        image: background,
        //borderRadius: BorderRadius.circular(10),
        //boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.black12)],
      );
    }
    else if (appearance == BformAppearance.business) {
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
