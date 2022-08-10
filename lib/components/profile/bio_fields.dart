import 'package:flutter/material.dart';

class BioFields extends StatelessWidget {
  BioFields({required this.title, required this.value});
  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: 36, color: Colors.black, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
