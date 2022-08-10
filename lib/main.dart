// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/home/home_scaffold.dart';
import 'package:matchmaking_demo/interests/interests_1.dart';
import 'package:matchmaking_demo/interests/interests_2.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'components/interests/all_set.dart';
import 'interests/interests_3.dart';
import 'signup/sign_up_page.dart';
import 'login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      initialRoute: '/sign_up',
      routes: {
        '/login': (context) => Login(),
        '/sign_up': (context) => SignUp(),
        '/interests_1': (context) => InterestsOne(),
        '/interests_2': (context) => InterestsTwo(),
        '/interests_3': (context) => InterestsThree(),
        '/all_set': (context) => AllSet(),
        '/home': (context) => HomeScaffold()
      },
    );
  }
}
