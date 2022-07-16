import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/interests/interests_page.dart';
import 'package:matchmaking_demo/components/interests/interests_scaffold.dart';

class InterestsOne extends StatelessWidget {
  const InterestsOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InterestsScaffold(
      child: InterestsPage(
        pageNumber: 1,
        nextPage: '/interests_2',
        showBackButton: false,
      ),
    );
  }
}
