// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'dart:core';

class GenderRadioButton extends StatefulWidget {

  const GenderRadioButton({Key? key}) : super(key: key);

  @override
  State<GenderRadioButton> createState() => _GenderRadioButtonState();
}

class _GenderRadioButtonState extends State<GenderRadioButton> {
  late  String? gender;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Row(
        children: [
          Container(
            width: 110.0,
            child: RadioListTile(
                title: Text("Male",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    color: Colors.grey,
                  ),),
                contentPadding: EdgeInsets.all(0),
                value: "male",
                groupValue: gender,
                onChanged: (value){
                  setState((){
                    gender=value.toString();
                  });
                }),
          ),
          Container(
            width: 110.0,
            child: RadioListTile(
                title: Text("Female",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    color: Colors.grey,
                  ),),
                contentPadding: EdgeInsets.all(0),
                value: "female",
                groupValue: gender,
                onChanged: (value){
                  setState((){
                    gender=value.toString();
                  });
                }),
          ),
        ],
      ),
    );
  }
}
