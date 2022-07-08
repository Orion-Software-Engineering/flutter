import 'package:flutter/material.dart';
import '../../utils/constants.dart';

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
            style: const TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtext,
            style: const TextStyle(
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
