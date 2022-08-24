/*
* This widget is for displaying avatars (profile pictures)*/

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({Key? key, required this.firstCharacter})
      : super(key: key);
  final String firstCharacter;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Text(
        firstCharacter,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
      )),
    );
  }
}
