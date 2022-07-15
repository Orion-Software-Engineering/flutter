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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      initialRoute: '/home',
      routes: {
        '/login': (context) => Login(),
        '/sign_up': (context) =>
            SignUp(), //TODO Bridge between '/sign_up' and '/interests_1' not built yet. Check TODOs for specifics.
        '/interests_1': (context) => InterestsOne(),
        '/interests_2': (context) => InterestsTwo(),
        '/interests_3': (context) => InterestsThree(),
        '/all_set': (context) => AllSet(),
        '/home': (context) => HomeScaffold()
      },
    );
  }
}
