import 'package:flutter/material.dart';
import 'bform_table_cell.dart';

class BformTable extends StatelessWidget {
  final List<Widget> headers;
  final List<List<Widget>> rows;
  final List<Widget?> actionButtons;
  final Color? colorHeader;
  final Color? color;
  const BformTable({
    super.key,
    required this.headers,
    required this.rows,
    this.actionButtons = const [],
    this.colorHeader,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      //defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            for (final header in headers)
              BformTableCell(
                child: header,
                color: colorHeader,
              ),
          ],
        ),
        for (final row in rows)
          TableRow(
            children: <Widget>[
              for (var column in row)
                BformTableCell(
                  color: color,
                  child: column,
                ),
            ],
          ),
      ],
    );
  }
}
