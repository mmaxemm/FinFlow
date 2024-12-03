import 'package:finflow/features/add_expenses/view.dart';
import 'package:finflow/features/home_page/view.dart';
import '../features/add_expenses/category/add_category/view.dart';
import '../features/add_expenses/category/view.dart';

final routes = {
  '/': (context) => const HomePage(title: 'FinFlow',),
  '/add_expenses': (context) => const AddExpenses(title: 'Add Expenses'),
  '/add_expenses/category': (context) => const AddExpensesCategory(title: 'Choose category'),
  '/add_expenses/category/add_category': (context) => const AddCategory(title: 'Add category'),
};