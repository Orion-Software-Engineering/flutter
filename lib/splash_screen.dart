import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_service_login.dart';
import 'models/login_model.dart';

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
      color: Colors.white,
      child: Center(
        child: Image.asset("assets/images/interests/Orion logo(!BG) 3.png",
            scale: 2.5),
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
      APIServiceLogin apiService = APIServiceLogin();
      apiService.login(widget.requestModel!).then((value) {
        checkIfLoginSuccessful = true;
        Navigator.pushNamed(context, '/home');
      });
      if (!checkIfLoginSuccessful) {
        Navigator.pushNamed(context, '/login');
        print("splash login unsuccessful");
      }
    } else {
      Navigator.pushNamed(context, '/login');
      print("noting saved");
    }
  }
}
