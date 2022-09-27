import 'package:flutter/material.dart';
import 'package:matchmaking_demo/profile/profile.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:matchmaking_demo/utils/dark_theme_provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'signup/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    initPlatformState();
  }

  static const String oneSignalAppId = '0bfcc099-9621-4dba-a906-7aa5cefae056';

  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(oneSignalAppId);
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
  }

  void getCurrentAppTheme() async {
    String selectedTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
    if (selectedTheme == 'dark') {
      themeChangeProvider.darkTheme = ThemeMode.dark;
    } else if (selectedTheme == 'light') {
      themeChangeProvider.darkTheme = ThemeMode.light;
    } else if (selectedTheme == 'system') {
      themeChangeProvider.darkTheme = ThemeMode.system;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          onUnknownRoute: AppRouter.onUnknownRoute,
          debugShowCheckedModeBanner: false,
          title: 'Orion Meet',
          themeMode: themeChangeProvider.darkTheme,
          theme: MyThemes.themeData(false, context),
          darkTheme: MyThemes.themeData(true, context),
          // initialRoute: AppRouter.splash,
          home: Profile(userId: "fd4e6b78-f8f2-4367-8a94-ce10f0d76543"),
        );
      }),
    );
  }
}
