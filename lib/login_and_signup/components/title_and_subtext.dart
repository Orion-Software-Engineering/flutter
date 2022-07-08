import 'package:flutter/material.dart';
import 'package:matchmaking_demo/constants.dart';

class TitleAndSubtext extends StatelessWidget {
  TitleAndSubtext({required this.title, required this.subtext});
  String title;
  String subtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtext,
            style: TextStyle(
              color: signUpLoginTextColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
