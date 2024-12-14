import 'package:flutter/material.dart';

class AddSmth extends StatefulWidget {
  const AddSmth({super.key, required this.title});

  final String title;

  @override
  State<AddSmth> createState() => _AddSmthState();
}

class _AddSmthState extends State<AddSmth> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final routeName = ModalRoute.of(context)!.settings.name;
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
              double? value = double.tryParse(_controller.text);
              if (value != null && value > 0) {
                if (routeName == '/add_expenses') {
                  Navigator.of(context).pushNamed('/add_expenses/category',
                      arguments: value);
                }
                if (routeName == '/add_income') {
                  Navigator.of(context).pushNamed('/add_income/category',
                      arguments: value);
                }
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
