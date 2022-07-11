import 'package:flutter/material.dart';

class InterestsScaffold extends StatelessWidget {
  InterestsScaffold({required this.child});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 635,
            right: -10,
            left: -10,
            child: Image.asset('assets/images/interests/Orion logo(!BG) 3.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 55.0, 25, 0),
            child: Container(
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
