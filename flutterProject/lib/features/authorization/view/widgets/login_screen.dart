import 'package:finflow/features/authorization/authorization.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameFocusNode = FocusNode();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _usernameFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _usernameFocusNode.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(13.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Log in to safe your data',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 13),
              TextFormField(
                focusNode: _usernameFocusNode,
                controller: _usernameController,
                validator: validateUsername,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 13),
              TextFormField(
                validator: validatePassword,
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 13),
              SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        signIn(username: username, password: password, context: context);
                      }
                    },
                    child: Text(
                      'Log in',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ))
            ],
          ),
        ));
  }
}
