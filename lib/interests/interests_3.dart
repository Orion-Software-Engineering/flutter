import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/interests/interests_scaffold.dart';
import '../components/interests/interests_page.dart';

class InterestsThree extends StatelessWidget {
  const InterestsThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InterestsScaffold(
      child: InterestsPage(
        nextPage: '/all_set',
        showBackButton: true,
        pageNumber: 3,
      ),
    );
  }
}
