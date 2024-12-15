import 'package:flutter/material.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({super.key, required this.title});

  final String title;

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter a number',
            border: OutlineInputBorder(),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              double? incomeValue = double.tryParse(_controller.text);
              if (incomeValue != null && incomeValue > 0) {
                Navigator.of(context).pushNamed('/add_income/category',
                    arguments: incomeValue);
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Add valid number"),
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
            child: const Text('Choose category')),
      ]),
    );
  }
}
