import 'package:flutter/material.dart';

class TitleAndSubtext extends StatelessWidget {
  const TitleAndSubtext({Key? key, required this.title, required this.subtext})
      : super(key: key);

  final String title;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Nunito',
            color: Theme.of(context).primaryTextTheme.bodyText1?.color,
            fontSize: 40.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          subtext,
          style: TextStyle(
            color: Theme.of(context).primaryTextTheme.bodyText2?.color,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
