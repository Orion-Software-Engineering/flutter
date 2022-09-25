import 'package:flutter/material.dart';

class ProfileFields extends StatelessWidget {
  ProfileFields(
      {required this.title,
      this.value,
      required this.isGender,
      this.genderValue});
  String? title;
  String? value;
  String text = "";
  bool isGender;
  bool? genderValue;

  @override
  Widget build(BuildContext context) {
    if (isGender) {
      switch (genderValue) {
        case null:
          text = "...";
          break;
        case true:
          text = "M";
          break;
        case false:
          text = "F";
          break;
      }
    } else {
      text = (value == null) ? "..." : value!;
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).primaryTextTheme.bodyText2?.color,
                fontWeight: FontWeight.w400),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: (title == 'Bio') ? 20 : 26,
                color: Theme.of(context).primaryTextTheme.bodyText1?.color,
                fontWeight:
                    (title == 'Bio') ? FontWeight.w400 : FontWeight.w500),
          )
        ],
      ),
    );
  }
}
