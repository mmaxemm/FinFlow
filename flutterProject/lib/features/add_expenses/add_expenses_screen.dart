import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key, required this.title});

  final String title;

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
      ),
      body: Column(children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter a number',
            border: OutlineInputBorder(),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              double? expenseValue = double.tryParse(_controller.text);
              if (expenseValue != null && expenseValue > 0) {
                Navigator.of(context).pushNamed('/add_expenses/category',
                    arguments: expenseValue);
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text("Add valid number"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text('Choose category')),
      ]),
    );
  }
}
