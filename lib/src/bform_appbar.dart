import 'package:flutter/material.dart';

class BformAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final IconData? icon;
  const BformAppbar({
    super.key,
    required this.title,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
