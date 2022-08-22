import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/constants.dart';

import 'interests_bullet.dart';

class ActiveInterestsList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ActiveInterestsList({required this.interestList});
  final List<String> interestList;

  @override
  Widget build(BuildContext context) {
    List<InterestsBullet> interestBulletList = [];
    for (String a in interestList) {
      interestBulletList.add(InterestsBullet(interest: a));
    }
    return Wrap(spacing: 10, children: interestBulletList);
  }
}
