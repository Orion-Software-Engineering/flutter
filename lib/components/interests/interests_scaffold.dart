import 'package:flutter/material.dart';

class InterestsScaffold extends StatelessWidget {
  const InterestsScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7,
              right: MediaQuery.of(context).size.height * -0.05,
              left: MediaQuery.of(context).size.height * -0.05,
              child:
                  Image.asset('assets/images/interests/Orion logo(!BG) 3.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 50.0, 25, 0),
              child: Container(
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
