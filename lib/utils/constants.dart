import 'package:flutter/material.dart';

const Color signUpLoginTextColor = Colors.grey;
const Color signUpLoginOrange = Color(0xFFcd5d27);
const Color orionLogoCenterColor = Color(0xFF1B1129);
const TextStyle signUpLoginTextFieldTextStyle =
    TextStyle(color: signUpLoginTextColor, fontFamily: 'Nunito', fontSize: 16);

//apis

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

const Color messageTileColor = Color(0x99D9D9D9);

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

// class MyThemes {
//   static final darkTheme = ThemeData(
//       scaffoldBackgroundColor: orionLogoCenterColor,
//       fontFamily: 'Nunito',
//       colorScheme: ColorScheme.dark()
//           .copyWith()); //TODO Icon Theme and primary icon theme as well as primary color)
//
//   //1b1129
//
//   static final lightTheme = ThemeData(
//       scaffoldBackgroundColor: Colors.white,
//       fontFamily: 'Nunito',
//       colorScheme: ColorScheme.light());
// }
class MyThemes {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        canvasColor: isDarkTheme ? Color(0xFF241837) : Colors.white,
        primaryColor: isDarkTheme ? Colors.black : Colors.white,
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        primaryTextTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.grey),
            bodyText1: TextStyle(
              color: isDarkTheme ? Colors.white : Colors.black,
            )),
        cardColor: isDarkTheme ? Colors.blue : Colors.black,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        ));
  }
}
