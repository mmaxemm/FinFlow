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

  late double expenseValue;

  final TextEditingController _controller = TextEditingController();

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
                expenses.add(Category(categoryName, 0));
                Expenses.instance.addValueByName(categoryName, expenseValue);
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
