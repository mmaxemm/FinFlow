import 'package:finflow/fin_flow_app.dart';
import 'package:flutter/material.dart';

class AddExpensesCategory extends StatefulWidget {
  const AddExpensesCategory({super.key, required this.title});

  final String title;

  @override
  State<AddExpensesCategory> createState() => _AddExpensesCategoryState();
}

class _AddExpensesCategoryState extends State<AddExpensesCategory> {
  List<Category> expenses = Expenses.instance.expenses;

  late double expenseValue;

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is double) {
      expenseValue = args;
    }
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

      // Table(
      //   children: _buildTableRows(expenses),
      // )
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
    if (cellContent == 'Add category') {
      Navigator.of(context).pushNamed('/add_expenses/category/add_category', arguments: expenseValue);
    } else {
      Expenses.instance.addValueByName(cellContent, expenseValue);
      Navigator.of(context).pushNamed('/');
    }
  }
}
