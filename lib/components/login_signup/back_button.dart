import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            size: 40,
            color: Colors.white,
          ),
          onTap: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
