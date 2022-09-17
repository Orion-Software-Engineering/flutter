import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_service_login.dart';
import '../models/login_model.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  String? obtainedUsername;
  String? obtainedPassword;
  LoginRequestModel? requestModel;

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
  }

  @override
  void initState() {
    super.initState();
    checkForPreviousLoginDetails();
    Timer(Duration(seconds: 1), () => routeToApp());
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
