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
        "You're all set Happy Matchin'!",
        style: interestsTitleStyle,
      ),
    ));
  }
}
