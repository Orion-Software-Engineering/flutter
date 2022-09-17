// ignore_for_file: use_key_in_widget_constructors
/*
* Screen that shows when user is done selecting interests*/
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/interests/interests_scaffold.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class AllSet extends StatefulWidget {
  @override
  State<AllSet> createState() => _AllSetState();
}

class _AllSetState extends State<AllSet> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),
        () => Navigator.of(context).enterAppThroughLoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return InterestsScaffold(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            "You're all set Happy Matching'!",
            style: interestsTitleStyle,
          ),
          Text(
            "Please check your email to verify your account",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    ));
  }
}
