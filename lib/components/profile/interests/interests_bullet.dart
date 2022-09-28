import 'package:flutter/material.dart';

class InterestsBullet extends StatelessWidget {
  InterestsBullet({super.key, required this.interest});
  String interest;

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (interest) {
      case 'art':
        {
          color = Color(0xff0ed200);
        }
        break;
      case 'business':
        {
          color = Colors.black;
        }
        break;
      case 'cars':
        {
          color = Color(0xff605F5F);
          interest = "Cars & Vehicles";
        }
        break;
      case 'comedy':
        {
          color = Color(0xffd2b900);
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
          color = Color(0xff009dff);
        }
        break;
      case 'beauty':
        {
          color = Color(0xff6d008d);
          interest = "Hair & Beauty";
        }
        break;
      case 'news':
        {
          color = Color(0xff830303);
          interest = "News & Politics";
        }
        break;
      case 'photography':
        {
          color = Color(0xff35880b);
        }
        break;
      case 'science':
        {
          color = Color(0xFFFF8800);
          interest = "Science & Technology";
        }
        break;
      case 'sports':
        {
          color = Color(0xff013a1a);
        }
        break;
      case 'health':
        {
          color = Color(0xff4000ff);
          interest = 'Health & Fitness';
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6),
          child: Text(
            interest[0].toUpperCase() + interest.substring(1),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
