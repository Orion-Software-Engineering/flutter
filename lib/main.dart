import 'package:flutter/material.dart';
import 'package:matchmaking_demo/interests/interests_1.dart';
import 'package:matchmaking_demo/interests/interests_2.dart';
import 'interests/interests_3.dart';
import 'signup/sign_up_page.dart';
import 'login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Nunito",
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/sign_up': (context) => SignUp(),
        '/interests_1': (context) => InterestsOne(),
        '/interests_2': (context) => InterestsTwo(),
        '/interests_3': (context) => InterestsThree()
      },
    );
  }
}
