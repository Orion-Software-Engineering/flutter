/*
* This widget is for displaying avatars (profile pictures)*/

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder(
      {Key? key,
      required this.firstCharacter,
      required this.characterColor,
      required this.avatarColor})
      : super(key: key);
  final String firstCharacter;
  final Color? characterColor;
  final Color? avatarColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: avatarColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Text(
        firstCharacter,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w900, color: characterColor),
      )),
    );
  }
}
