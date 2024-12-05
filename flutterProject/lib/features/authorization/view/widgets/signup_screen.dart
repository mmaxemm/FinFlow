import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        children: [
          Text(
            'Sign up to safe your data',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 13),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email address',
            ),
          ),
          const SizedBox(height: 13),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
          ),
          const SizedBox(height: 13),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Confirm password',
            ),
            obscureText: true,
          ),
          const SizedBox(height: 13),
          SizedBox(
              width: 150,
              height: 50,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: Text(
                  'Sign up',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ))
        ],
      ),
    );
  }
}
