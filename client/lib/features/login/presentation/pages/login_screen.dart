import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/unboxing.png'),
              const Text('Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Text('Welcome back, please login to your account',
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        )),
      ),
    );
  }
}
