/*
* This widget is the button used for selecting interests in interests_page.dart
* When toggled on it adds its value (text) to the list (set) of interests globalInterestsSet in variables.dart
* When toggled off it does the opposite*/

import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/variables.dart';

class InterestsButton extends StatefulWidget {
  const InterestsButton({Key? key, required this.text}) : super(key: key);
  final String text;

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
          selected
              ? globalInterestsSet.add(interestsMap[widget.text]!)
              : globalInterestsSet.remove(interestsMap[widget.text]!);
          //print('hit');
        });
      },
      child: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 22),
          height: 50,
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
