import 'package:flutter/material.dart';

class LogInSignUpScaffold extends StatelessWidget {
  const LogInSignUpScaffold({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage('assets/images/sign_in/Sign Up bg.png'),
              fit: BoxFit.cover),
        ),
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 0.0, 20.0, 0),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
