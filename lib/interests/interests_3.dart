import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/interests/interests_scaffold.dart';
import '../components/interests/interests_page.dart';

class InterestsThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InterestsScaffold(
      child: InterestsPage(
        showBackButton: true,
        pageNumber: 3,
      ),
    );
  }
}
