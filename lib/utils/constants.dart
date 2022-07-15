import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_signup.dart';

const Color signUpLoginTextColor = Colors.grey;
const Color signUpLoginOrange = Color(0xFFcd5d27);
const Color orionLogoCenterColor = Color(0xFF1B1129);
const TextStyle signUpLoginTextFieldTextStyle =
    TextStyle(color: signUpLoginTextColor, fontFamily: 'Nunito', fontSize: 16);

//apis

const String scheme = "https";
const String host = "orion-meet.herokuapp.com";
const String logInPath = "/api/auth/signin";
const String signUpPath = "/api/auth/signup";
const String interestPath="/api/interest/";

const TextStyle loginSignUpButtonTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
const TextStyle signUpLoginTextButtonStyleOrange = TextStyle(
  color: signUpLoginOrange,
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

//INTERESTS
const List<String> interestsList = [
  'Art',
  'Business',
  'Cars & Vehicles',
  'Comedy',
  'Vacation',
  'Entertainment',
  'Food',
  'Fashion',
  'Gaming',
  'Health & Fitness',
  'Hair & Beauty',
  'News & Politics',
  'Photography',
  'Science & Technology',
  'Sports'
];

const TextStyle interestsTitleStyle =
    TextStyle(fontSize: 40, fontFamily: 'Nunito', fontWeight: FontWeight.w700);

const TextStyle interestsButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito');

const Color interestsButtonColorNormal = Color(0xFF222222);

const Color interestsButtonColorSelected = Color(0xFF205098);

const TextStyle interestsPageNumberStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.grey);

const TextStyle interestsPageNextBackStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.grey);

//THEMES

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: orionLogoCenterColor,
      fontFamily: 'Nunito',
      colorScheme: ColorScheme.dark());

  //1b1129

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Nunito',
      colorScheme: ColorScheme.light());
}
