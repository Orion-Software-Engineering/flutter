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
            top: MediaQuery.of(context).size.height * -0.3,
            right: MediaQuery.of(context).size.width * 0.6,
            left: MediaQuery.of(context).size.width * -0.3,
            bottom: MediaQuery.of(context).size.height * 0.6,
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
