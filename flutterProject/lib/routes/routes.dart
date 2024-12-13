import 'package:finflow/features/add_expenses/view.dart';
import 'package:finflow/features/authorization/view/authorization_screen.dart';
import 'package:finflow/features/home_page/view.dart';
//import '../features/add_expenses/category/add_category/view.dart';
import '../features/add_category/view.dart';
import '../features/add_expenses/category/view.dart';
import '../features/add_income/category/view.dart';
import '../features/add_income/view.dart';
//import '../features/add_income/category/add_category/view.dart';
import '../features/delete_category/view.dart';

final routes = {
  '/': (context) => const HomePage(title: 'FinFlow',),
  '/add_expenses': (context) => const AddExpenses(title: 'Add Expenses'),
  '/add_expenses/category': (context) => const AddExpensesCategory(title: 'Choose category'),
  '/add_expenses/category/add_category': (context) => const AddCategory(title: 'Add category'),
  '/add_income': (context) => const AddIncome(title: 'Add Income'),
  '/add_income/category': (context) => const AddIncomeCategory(title: 'Choose category'),
  '/add_income/category/add_category': (context) => const AddCategory(title: 'Add category'),
  '/authorization' : (context) => const AuthorizationScreen(title: 'Authorization'),
  '/delete_category' : (context) => const DeleteCategory(title: 'Choose category'),
};