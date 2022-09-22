// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matchmaking_demo/api/login_signup_interests/api_service_login.dart';
import 'package:matchmaking_demo/components/login_signup/login_signup_scaffold.dart';
import 'package:matchmaking_demo/components/login_signup/title_and_subtext.dart';
import 'package:matchmaking_demo/models/progress_popup.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/login_signup/custom_password_field.dart';
import '../models/login_signup_interests/login_model.dart';
import '../utils/constants.dart';
import 'package:matchmaking_demo/splash/splash_screen.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp userNameValid = RegExp(r"^[a-zA-Z0-9_]*$");
  RegExp passwordValid = RegExp(r".+");
  bool isLoading = false;
  late LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Progress(
      isLoading: isLoading,
      opacity: 0.3,
      child: _ui(context),
    );
  }

  Widget _ui(BuildContext context) {
    return LogInSignUpScaffold(
      shouldPop: false,
      key: scaffoldKey,
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: TitleAndSubtext(
                    title: 'Sign In',
                    subtext: 'Enter your username and password'),
              ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              ?.color,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: signUpLoginTextFieldTextStyle,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        onSaved: (value) => requestModel.username = value!,
                        validator: (value) {
                          if (userNameValid.hasMatch(value!) &&
                              value.isNotEmpty) {
                            String username = value.trim();
                            setState(() {
                              requestModel.username = username;
                            });
                            return null;
                          } else {
                            return "Enter a valid username";
                          }
                        },
                      ),
                      CustomPasswordField(
                          hintText: 'Password',
                          validationFunction: (value) {
                            if (value!.isNotEmpty &&
                                passwordValid.hasMatch(value)) {
                              String password = value;
                              setState(() {
                                requestModel.password = password;
                              });
                              return null;
                            } else {
                              return 'Enter a password';
                            }
                          }),
                      SizedBox(height: 30.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).cardColor,
                            // padding: EdgeInsets.fromLTRB(190.0, 10.0, 190.0, 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )),
                        onPressed: () {
                          if (validateAndSave()) {
                            setState(() {
                              isLoading = true;
                            });
                            LoginAPIService apiService = new LoginAPIService();
                            apiService.login(requestModel).then((value) {
                              setState(() {
                                isLoading = false;
                                if (statusCode == 200) {
                                  saveCredentials();
                                  Navigator.of(context)
                                      .enterAppThroughHomeScreen();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Login Successful')));
                                } else {
                                  Fluttertoast.showToast(
                                    msg: message,
                                    textColor: Theme.of(context).primaryColor,
                                    backgroundColor:
                                        Theme.of(context).iconTheme.color,
                                    timeInSecForIosWeb: 2,
                                    fontSize: 16,
                                  );
                                }
                              });
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0.0),
                          child: Center(
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).goToForgotPasswordScreen();
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: signUpLoginOrange,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1
                                    ?.color,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).goToSignUpScreen();
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: signUpLoginOrange,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save;
      return true;
    } else {
      return false;
    }
  }

  void saveCredentials() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("username", requestModel.username);
    sharedPreferences.setString("password", requestModel.password);
    sharedPreferences.setBool("allowLocation", false);
    print("saved");
    print(sharedPreferences.get("username"));
    print(sharedPreferences.get("password"));
  }
}
