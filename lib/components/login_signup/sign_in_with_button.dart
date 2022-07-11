import 'package:flutter/material.dart';

class SignInWithButton extends StatelessWidget {
  const SignInWithButton({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Image.asset(
        imagePath,
        height: 44,
        width: 45,
      ),
    );
  }
}
