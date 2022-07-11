import 'package:flutter/material.dart';

const Color signUpLoginTextColor = Colors.grey;
const Color signUpLoginOrange = Color(0xFFcd5d27);
const TextStyle signUpLoginTextFieldTextStyle =
    TextStyle(color: signUpLoginTextColor, fontFamily: 'Nunito', fontSize: 16);

//apis
const String scheme = "https";
const String host = "orion-meet.herokuapp.com";
const String logInPath = "/api/auth/signin";
const String signUpPath = "/api/auth/signup";

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
    width: 2,
  ),
);
