/*
* This widget is for displaying avatars (profile pictures)*/

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class AvatarPlaceholder extends StatelessWidget {
  AvatarPlaceholder({Key? key, this.avatar}) : super(key: key);
  Widget? avatar;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: (avatar == null)
                ? FaIcon(color: Colors.white, FontAwesomeIcons.user)
                : avatar)
        // Image.asset('assets/images/home/user_profile_avatar.png'),
        );
  }
}
