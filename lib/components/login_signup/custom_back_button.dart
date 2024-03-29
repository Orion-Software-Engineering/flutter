import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBackButton extends StatelessWidget {
  GestureTapCallback? navigateTo;
  Color? backColor;
  CustomBackButton({Key? key, this.navigateTo, required this.backColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap:
              (navigateTo == null) ? () => Navigator.pop(context) : navigateTo,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: backColor,
            ),
          ),
        ),
      ],
    );
  }
}
