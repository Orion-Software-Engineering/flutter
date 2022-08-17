// ignore_for_file: use_key_in_widget_constructors
/*
* Screen that shows when user is done selecting interests*/
import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/interests/interests_scaffold.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class AllSet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InterestsScaffold(
        child: Center(
      child: Text(
        textAlign: TextAlign.center,
        "You're all set Happy Matching'!",
        style: interestsTitleStyle,
      ),
    ));
  }
}
