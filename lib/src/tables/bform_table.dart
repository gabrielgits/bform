import 'package:flutter/material.dart';
import 'bform_table_cell.dart';

class BformTable extends StatelessWidget {
  final List<String> titles;
  final List<List<String>> rows;
  final List<Widget?> actionButtons;
  final String? actionTitle;
  const BformTable(
      {super.key,
      required this.titles,
      required this.rows,
      this.actionButtons = const [],
      this.actionTitle});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      //defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            for (var title in titles) BformTableCell(child: Text(title)),
            if (actionTitle != null)
              BformTableCell(child: Text(actionTitle ?? '')),
          ],
        ),
        for (int i = 0; i < rows.length; i++)
          TableRow(
            children: <Widget>[
              for (var column in rows[i])
                BformTableCell(
                  color: Colors.lime,
                  child: Text(column),
                ),
              if (actionButtons[i] != null)
                BformTableCell(child: actionButtons[i] ?? const SizedBox()),
            ],
          ),
      ],
    );
  }
}
