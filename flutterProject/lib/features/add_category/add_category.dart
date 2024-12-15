import 'package:finflow/fin_flow_app.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key, required this.title});

  final String title;

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  List<Category> expenses = Expenses.instance.expenses;
  List<Category> income = Income.instance.income;

  late double value;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final routeName = ModalRoute.of(context)!.settings.name;
    final Object? args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is double) {
      value = args;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Category name',
            border: OutlineInputBorder(),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              String? categoryName = _controller.text;
              if (categoryName != '') {
                if (routeName == '/add_expenses/category/add_category') {
                  expenses.add(Category(categoryName, 0));
                  Expenses.instance.addValueByName(categoryName, value);
                }
                if (routeName == '/add_expenses/category/add_category') {
                  income.add(Category(categoryName, 0));
                  Income.instance.addValueByName(categoryName, value);
                }
                Navigator.of(context).pushNamed('/');
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Add valid name"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text('Add category'))
      ]),
    );
  }
}
