import 'package:flutter/material.dart';
import 'bform_table.dart';

class BformTableText extends StatelessWidget {
  final List<String> titles;
  final List<List<String>> listElements;
  final String actionTitle;
  final List<Widget?> actionButtons;
  final Color? colorTextTitle;
  final Color? backgroundTitle;
  final Color? colorText;
  final Color? background;
  const BformTableText({
    super.key,
    required this.titles,
    required this.listElements,
    this.actionButtons = const [],
    this.colorText,
    this.colorTextTitle,
    this.background,
    this.backgroundTitle,
    this.actionTitle = 'Action',
  });

  @override
  Widget build(BuildContext context) {
    final headers = titles
        .map((e) => Text(e, style: TextStyle(color: colorTextTitle)))
        .toList();
    if (actionButtons.isNotEmpty) {
      headers.add(Text(actionTitle, style: TextStyle(color: colorTextTitle)));
    }
    List<List<Widget>> rows = [];
    int i = 0;
    for (final elements in listElements) {
      List<Widget> row = [
        ...elements
            .map((e) => Text(e, style: TextStyle(color: colorText)))
            .toList()
      ];

      if (actionButtons.isNotEmpty) {
        row.add(actionButtons[i]!);
      }
      i++;
      rows.add(row);
    }
    return BformTable(
      headers: headers,
      rows: rows,
      colorHeader: backgroundTitle,
      color: background,
      border: TableBorder.all(),
    );
  }
}
