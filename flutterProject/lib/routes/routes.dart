import '../features/add_expenses/view.dart';
import '../features/home_page/view.dart';
import '../features/add_expenses/category/add_category/view.dart';
import '../features/add_expenses/category/view.dart';
import '../features/delete_category/view.dart';

final routes = {
  '/': (context) => const HomePage(title: 'FinFlow',),
  '/add_expenses': (context) => const AddExpenses(title: 'Add Expenses'),
  '/add_expenses/category': (context) => const AddExpensesCategory(title: 'Choose category'),
  '/add_expenses/category/add_category': (context) => const AddCategory(title: 'Add category'),
  '/delete_category' : (context) => const DeleteCategory(title: 'Choose category'),
};