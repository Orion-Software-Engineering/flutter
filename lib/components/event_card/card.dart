import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/variables.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      width: 150.0,
      height: 200.0,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(FlyerURLs[index].urls),
            fit: BoxFit.fill,
          ),
          color: Colors.grey,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
