import 'package:finflow/features/authorization/authorization.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _emailFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
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
                'Log in to safe your data',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 13),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocusNode,
                controller: _emailController,
                validator: validateEmail,
                decoration: const InputDecoration(
                  labelText: 'Email address',
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
                        final email = _emailController.text;
                        final password = _passwordController.text;
                        sendAuthInfo(email: email, password: password, context: context);
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
