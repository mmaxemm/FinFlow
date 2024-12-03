import 'package:finflow/fin_flow_app.dart';
import 'package:flutter/material.dart';

class DeleteCategory extends StatefulWidget {
  const DeleteCategory({super.key, required this.title});

  final String title;

  @override
  State<DeleteCategory> createState() => _DeleteCategoryState();
}

class _DeleteCategoryState extends State<DeleteCategory> {
  List<Category> expenses = Expenses.instance.expenses;
  AnimationController _controller = AnimationController( duration: const Duration(milliseconds: 500), vsync: this, )..repeat(reverse: true);
  Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double cellWidth = (constraints.maxWidth - 32) / 3;
          return SingleChildScrollView(
              child: Table(
                border: TableBorder.all(
                  color: const Color(0xfffef7ff),
                  width: 3,
                ),
                children: _buildTableRows(expenses, cellWidth),
              ));
        },
      ),
    );
  }

  List<TableRow> _buildTableRows(List<Category> items, double cellWidth) {
    List<TableRow> rows = [];
    for (int i = 0; i < items.length; i += 3) {
      rows.add(
        TableRow(
          children: [
            _buildCell(items[i].name, cellWidth),
            if (i + 1 < items.length)
              _buildCell(items[i + 1].name, cellWidth)
            else
              Container(),
            if (i + 2 < items.length)
              _buildCell(items[i + 2].name, cellWidth)
            else
              Container(),
          ],
        ),
      );
    }
    return rows;
  }

  Widget _buildCell(String cellContent, double cellWidth) {
    return GestureDetector(
      onTap: () => _onCellTapped(cellContent),
      child: Container(
        height: cellWidth,
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text(
            cellContent,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _onCellTapped(String cellContent) {

  }
}
