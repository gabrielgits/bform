import 'package:flutter/material.dart';
import 'bform_table_cell.dart';

class BformTable extends StatelessWidget {
  final List<Widget> headers;
  final List<List<Widget>> rows;
  final Color? colorHeader;
  final Color? color;
  final TableBorder? border;
  const BformTable({
    super.key,
    required this.headers,
    required this.rows,
    this.colorHeader,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: border,
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
