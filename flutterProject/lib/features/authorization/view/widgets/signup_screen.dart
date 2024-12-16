import 'package:finflow/features/authorization/authorization.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameFocusNode = FocusNode();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
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
    _emailController.dispose();
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
                'Sign up to safe your data',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 13),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: _usernameFocusNode,
                controller: _usernameController,
                validator: validateUsername,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 13),
              TextFormField(
                controller: _emailController,
                validator: validateEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 13),
              TextFormField(
                controller: _passwordController,
                validator: validatePassword,
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
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        signUp(username: username, email: email, password: password, context: context);
                      }
                    },
                    child: Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ))
            ],
          ),
        ));
  }
}
