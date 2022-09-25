import 'package:flutter/material.dart';

class InterestsBullet extends StatelessWidget {
  const InterestsBullet({super.key, required this.interest});
  final String interest;

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (interest) {
      case 'art':
        {
          color = Colors.green;
        }
        break;
      case 'business':
        {
          color = Colors.black;
        }
        break;
      case 'Cars & Vehicles':
        {
          color = Color(0xff605F5F);
        }
        break;
      case 'comedy':
        {
          color = Colors.yellow;
        }
        break;
      case 'Vacation':
        {
          color = Colors.green;
        }
        break;
      case 'entertainment':
        {
          color = Color(0xffe50404);
        }
        break;
      case 'food':
        {
          color = Color(0xffcc5500);
        }
        break;
      case 'fashion':
        {
          color = Color(0xffff00b7);
        }
        break;
      case 'gaming':
        {
          color = Color(0xff007fff);
        }
        break;
      case 'Hair and Beauty':
        {
          color = Color(0xff6d008d);
        }
        break;
      case 'News & Politics':
        {
          color = Color(0xff830303);
        }
        break;
      case 'photography':
        {
          color = Color(0xff35880b);
        }
        break;
      case 'Science & Technology':
        {
          color = Color(0xFFFF8800);
        }
        break;
      case 'sports':
        {
          color = Color(0xffb7ff00);
        }
        break;
      case 'Health & Fitness':
        {
          color = Color(0xff00ffff);
        }
        break;
      case 'education':
        {
          color = Color(0xffc6d09b);
        }
        break;
      default:
        color = Color(0x00ffffff);
        break;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
        ),
        Text(
          interest[0].toUpperCase() + interest.substring(1),
          style: TextStyle(
              color: Theme.of(context).primaryTextTheme.bodyText1?.color),
        )
      ],
    );
  }
}
