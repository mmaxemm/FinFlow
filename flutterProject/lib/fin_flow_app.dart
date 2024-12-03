import 'package:flutter/material.dart';
import 'package:finflow/routes/routes.dart';

class Category {
  String name;
  double value;

  Category(this.name, this.value);
}

class Expenses {
  Expenses._privateConstructor();
  static final Expenses instance = Expenses._privateConstructor();

  void addValueByName(String name, double value) {
    for (var category in expenses) {
      if (category.name == name) {
        category.value += value;
        break;
      }
    }
  }

  List<Category> expenses = [
    Category('Food', 10),
    Category('Home', 10),
    Category('Health', 0),
    Category('Gifts', 0),
    Category('Food2', 10),
    Category('Home2', 10),
    Category('Health2', 0),
    Category('Gifts2', 0),
    Category('Food3', 10),
    Category('Home3', 10),
    Category('Health3', 0),
    Category('Gifts3', 0),
    Category('Food4', 10),
    Category('Home4', 10),
    Category('Health4', 0),
    Category('Gifts4', 0),
    Category('Food5', 10),
    Category('Home5', 10),
    Category('Health5', 0),
    Category('Gifts5', 0),
    Category('Add category', 0)
  ];
}

class FinFlow extends StatelessWidget {
  const FinFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
    );
  }
}
