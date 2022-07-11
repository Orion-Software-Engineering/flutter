import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class InterestsButton extends StatefulWidget {
  InterestsButton({required this.text});
  String text;

  @override
  State<InterestsButton> createState() => _InterestsButtonState();
}

class _InterestsButtonState extends State<InterestsButton> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
          height: 44,
          width: double.infinity,
          decoration: BoxDecoration(
              color: selected
                  ? interestsButtonColorSelected
                  : interestsButtonColorNormal,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              widget.text,
              style: interestsButtonTextStyle,
            ),
          )),
    );
  }
}
