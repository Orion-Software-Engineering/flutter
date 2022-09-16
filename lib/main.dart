// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:matchmaking_demo/home/settings_page.dart';
import 'package:matchmaking_demo/utils/theme_listener.dart';
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
  DarkThemeProvider themeChanger = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChanger.darkTheme = await getTheme();
    print("main${themeChanger.darkTheme}");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        print(themeChanger.darkTheme);
        return themeChanger;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, child) {
        return MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          onUnknownRoute: AppRouter.onUnknownRoute,
          debugShowCheckedModeBanner: false,
          title: 'Orion Meet',
          themeMode: null,
          theme:
              themeChanger.darkTheme ? MyThemes.darkTheme : MyThemes.lightTheme,
          //darkTheme: MyThemes.darkTheme,
          initialRoute: AppRouter.splash,
        );
      }),
    );
  }
}
