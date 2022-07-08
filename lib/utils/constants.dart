import 'package:flutter/material.dart';

const Color signUpLoginTextColor = Colors.grey;
const Color signUpLoginOrange = Color(0xFFcd5d27);
const Color signUpLoginButtonColor = Colors.black;

const TextStyle signUpLoginTextFieldTextStyle =
    TextStyle(color: signUpLoginTextColor, fontFamily: 'Nunito', fontSize: 16);
const TextStyle loginSignUpButtonTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const TextStyle signUpLoginTextButtonStyleOrange = TextStyle(
  color: Color(0xFFcd5d27),
  fontWeight: FontWeight.w700,
  fontSize: 16.0,
  decoration: TextDecoration.underline,
);

const UnderlineInputBorder inputBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: signUpLoginTextColor,
  ),
);
