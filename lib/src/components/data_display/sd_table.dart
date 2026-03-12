import 'package:flutter/material.dart';

/// A column definition for [SDTable].
class SDTableColumn {
  const SDTableColumn({required this.label, this.numeric = false});
  final String label;
  final bool numeric;
}

/// A themed data table with horizontal scroll for overflow.
///
/// ```dart
/// SDTable(
///   columns: [SDTableColumn(label: 'Name'), SDTableColumn(label: 'Score', numeric: true)],
///   rows: [
///     [Text('Alice'), Text('95')],
///     [Text('Bob'),   Text('87')],
///   ],
/// )
/// ```
class SDTable extends StatelessWidget {
  const SDTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  final List<SDTableColumn> columns;
  final List<List<Widget>> rows;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(        // ← reads the available width from ListView
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(   // ← gives DataTable a real minimum width
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: DataTable(
              columns: columns
                  .map((col) => DataColumn(
                        label: Text(col.label),
                        numeric: col.numeric,
                      ))
                  .toList(),
              rows: rows
                  .map((cells) => DataRow(
                        cells: cells.map((cell) => DataCell(cell)).toList(),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
