// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:matchmaking_demo/utils/dark_theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChange = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChange.darkTheme = await themeChange.darkThemePreference.getTheme();
    print("main${themeChange.darkTheme}");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        print(themeChange.darkTheme);
        return themeChange;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, child) {
        return MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          onUnknownRoute: AppRouter.onUnknownRoute,
          debugShowCheckedModeBanner: false,
          title: 'Orion Meet',
          themeMode: null,
          //darkTheme: MyThemes.themeData(true, context),
          theme: MyThemes.themeData(true, context),
          //darkTheme: MyThemes.darkTheme,
          initialRoute: AppRouter.splash,
        );
      }),
    );
  }
}
