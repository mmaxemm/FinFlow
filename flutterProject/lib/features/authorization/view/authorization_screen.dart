import 'package:finflow/features/authorization/view/widgets/login_screen.dart';
import 'package:finflow/features/authorization/view/widgets/signup_screen.dart';
import 'package:flutter/material.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key, required this.title});

  final String title;

  @override
  State<AuthorizationScreen> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<AuthorizationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          bottom: TabBar(
            tabs: const [
              Tab(text: "Log in"),
              Tab(text: "Sign up"),
          ],
          labelStyle: Theme.of(context).textTheme.titleLarge,
          indicator: const BoxDecoration(),
          ),
        ),
        body: const TabBarView(
          children: [
            LoginScreen(),
            SignupScreen(),
        ]),
      ),
    );
  }
}