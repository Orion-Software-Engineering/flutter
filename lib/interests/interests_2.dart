import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/interests/interests_page.dart';
import 'package:matchmaking_demo/components/interests/interests_scaffold.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import '../components/interests/interests_button.dart';

class InterestsTwo extends StatelessWidget {
  const InterestsTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InterestsScaffold(
      child: InterestsPage(
        pageNumber: 2,
        showBackButton: true,
        nextPage: '/interests_3',
      ),
    );
  }
}
