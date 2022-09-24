import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBackButton extends StatelessWidget {
  GestureTapCallback? navigateTo;
  Color? backColor = Colors.white;
  CustomBackButton({Key? key, this.navigateTo, this.backColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap:
              (navigateTo == null) ? () => Navigator.pop(context) : navigateTo,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios,
                size: 30,
                color: Theme.of(context).primaryTextTheme.bodyText1?.color),
          ),
        ),
      ],
    );
  }
}
