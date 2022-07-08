import 'package:flutter/material.dart';

class SignInWithButton extends StatelessWidget {
  SignInWithButton({required this.imagePath});
  String imagePath;
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
