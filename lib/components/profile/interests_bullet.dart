import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class InterestsBullet extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const InterestsBullet({required this.interest});
  final String interest;

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (interest) {
      case 'Art':
        {
          color = Colors.green;
        }
        break;
      case 'Business':
        {
          color = Colors.black;
        }
        break;
      case 'Cars & Vehicles':
        {
          color = Colors.teal;
        }
        break;
      case 'Comedy':
        {
          color = Colors.yellow;
        }
        break;
      case 'Vacation':
        {
          color = Colors.green;
        }
        break;
      case 'Entertainment':
        {
          color = Color(0xff480202);
        }
        break;
      case 'Food':
        {
          color = Color(0xff007fff);
        }
        break;
      case 'Fashion':
        {
          color = Color(0xff007fff);
        }
        break;
      case 'Gaming':
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
          color = Color(0xff007fff);
        }
        break;
      case 'Photography':
        {
          color = Color(0xff007fff);
        }
        break;
      case 'Science & Technology':
        {
          color = Color(0xff007fff);
        }
        break;
      case 'Sports':
        {
          color = Color(0xff007fff);
        }
        break;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(8)),
        ),
        Text(interest)
      ],
    );
  }
}
