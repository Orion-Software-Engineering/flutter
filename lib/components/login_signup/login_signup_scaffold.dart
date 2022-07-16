import 'package:flutter/material.dart';

class LogInSignUpScaffold extends StatelessWidget {
  const LogInSignUpScaffold({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -280,
            right: 230,
            left: -130,
            bottom: 600,
            child: Image.asset('assets/images/interests/Orion logo(!BG) 3.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 50.0, 25, 0),
            child: Container(
              child: child,
            ),
          )
        ],
      ),
    );
  }
}

// Container(
// decoration: const BoxDecoration(
// color: Colors.black,
// image: DecorationImage(
// image: AssetImage('assets/images/sign_in/Sign Up bg.png'),
// fit: BoxFit.cover),
// ),
// height: double.infinity,
// padding: const EdgeInsets.fromLTRB(20, 0.0, 20.0, 0),
// width: double.infinity,
// child: child,
// )
