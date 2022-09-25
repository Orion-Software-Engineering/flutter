import 'package:flutter/material.dart';

Color signUpLoginTextColor = Colors.grey;
Color signUpLoginOrange = Color(0xFFcd5d27);
Color orionLogoCenterColor = Color(0xFF1B1129);
TextStyle signUpLoginTextFieldTextStyle =
    TextStyle(color: signUpLoginTextColor, fontFamily: 'Nunito', fontSize: 16);

//apis

//Mapping Interests & Colors
final Map<String, Color> InterestColors = {
  'art': Colors.deepPurple[900]!,
  'business': Colors.black,
  'cars': Colors.grey[800]!,
  'comedy': Colors.yellow,
  'education': Colors.yellow[100]!,
  'entertainment': Colors.red[900]!,
  'food': Colors.deepOrange,
  'fashion': Colors.pink,
  'gaming': Colors.blueAccent[400]!,
  'health': Colors.cyanAccent,
  'beauty': Colors.deepPurpleAccent,
  'news': Colors.deepOrange[900]!,
  'photography': Colors.green,
  'science': Colors.orange,
  'sports': Colors.lightGreenAccent[200]!
};

const List<Color> matchingCardColors = [
  Color(0xFF007AFF),
  Color(0xFF241837),
  Color(0xFFFF5A00),
  Color(0xFFFFD500),
  Color(0xFF007E24),
];

TextStyle loginSignUpButtonTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);
TextStyle signUpLoginTextButtonStyleOrange = TextStyle(
  color: signUpLoginOrange,
  fontWeight: FontWeight.w700,
  fontSize: 16.0,
  decoration: TextDecoration.underline,
);

UnderlineInputBorder inputBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: signUpLoginTextColor,
    width: 2,
  ),
);

//INTERESTS
List<String> interestsList = [
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

// TextStyle interestsTitleStyle =
//TextStyle(fontSize: 40, fontFamily: 'Nunito', fontWeight: FontWeight.w700);

TextStyle interestsButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito');

const Color interestsButtonColorNormal = Color(0xFF141415);

const Color interestsButtonColorSelected = Color(0xFF205098);

Color messageTileColor = Color(0x5FD9D9D9);

TextStyle interestsPageNumberStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.grey);

TextStyle interestsPageNextBackStyle = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.grey);

//THEMES

// class MyThemes {
//   static final darkTheme = ThemeData(
//      canvasColor:Color(0xFF241837),
//         primaryColor:Colors.black,
//         backgroundColor:Colors.black,
//         iconTheme: IconThemeData(
//           color:Colors.white,
//         ),
//         primaryTextTheme: TextTheme(
//             bodyText2: TextStyle(color: Colors.grey),
//             bodyText1: TextStyle(
//               color:Colors.white,
//             )),
//         cardColor:Colors.blue,
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//           backgroundColor:Colors.black,
//         ));
//
//   static final lightTheme = ThemeData(
//       canvasColor:Colors.white,
//         primaryColor:Colors.white,
//         backgroundColor:Colors.white,
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         primaryTextTheme: TextTheme(
//             bodyText2: TextStyle(color: Colors.grey),
//             bodyText1: TextStyle(
//               color: Colors.black,
//             )),
//         cardColor:Colors.black,
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//   backgroundColor:Colors.white,
//         ));
// }
class MyThemes {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      indicatorColor: isDarkTheme ? Colors.white : Colors.black,
      disabledColor: Color(0xFFBEBDBE),
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
        backgroundColor: isDarkTheme ? Color(0xFF0A0101) : Color(0xFFE9E9EA),
      ),
      appBarTheme: AppBarTheme(
          shadowColor: Colors.grey,
          iconTheme: IconThemeData(
              color: isDarkTheme ? Colors.grey : Color(0xFF494949)),
          backgroundColor: isDarkTheme ? Colors.black : Colors.white),
    );
  }
}
