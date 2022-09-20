import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/login_signup_interests/api_service_login.dart';
import '../models/login_model.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  String? obtainedUsername;
  String? obtainedPassword;
  LoginRequestModel? requestModel;
  static bool themeMode = false;

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future checkForPreviousLoginDetails() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    widget.obtainedUsername = sharedPreferences.getString("username");
    widget.obtainedPassword = sharedPreferences.getString("password");
    //todo it seems the corresponding sharedPreferences.setBool for the call below is never made.
    // todo that has to be fixed before the line below is uncommented else the app would be stuck on splash screen
    // SplashScreen.themeMode = sharedPreferences.getBool("ThemeStatus")!;
  }

  @override
  void initState() {
    super.initState();
    checkForPreviousLoginDetails().then((value) => routeToApp());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Image.asset("assets/images/interests/Orion logo(!BG) 3.png",
            scale: 3.5),
      ),
    );
  }

  void routeToApp() {
    bool checkIfLoginSuccessful = false;

    print("nnsnnsnns");
    print("username ${widget.obtainedUsername}");
    print("password ${widget.obtainedPassword}");

    if (widget.obtainedUsername != null && widget.obtainedPassword != null) {
      print(
          "user: ${widget.obtainedUsername} \n pass: ${widget.obtainedPassword}");
      widget.requestModel = LoginRequestModel();
      widget.requestModel!.username = widget.obtainedUsername!;
      widget.requestModel!.password = widget.obtainedPassword!;

      LoginAPIService apiService = LoginAPIService();
      apiService.login(widget.requestModel!).then((value) {
        if (value.statusCode == 200) {
          checkIfLoginSuccessful = true;
          Navigator.of(context).enterAppThroughHomeScreen();
          print("username ${widget.obtainedUsername}");
          print("password ${widget.obtainedPassword}");
        }
      }).then((value) {
        if (!checkIfLoginSuccessful) {
          Navigator.of(context).enterAppThroughLoginScreen();
          print("splash login unsuccessful");
        }
      });
    } else {
      Navigator.of(context).enterAppThroughLoginScreen();
      print("noting saved");
    }
  }
}
