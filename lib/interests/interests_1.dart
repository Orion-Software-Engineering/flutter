import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/interests/interests_scaffold.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import '../components/interests/interests_button.dart';

class InterestsOne extends StatelessWidget {
  const InterestsOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InterestsScaffold(
        child: Container(
      child: Column(
        children: [
          Text(
            "Let's know your interests!",
            style: interestsTitleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              InterestsButton(
                text: 'Text',
              )
            ],
          )
        ],
      ),
    ));
  }
}
