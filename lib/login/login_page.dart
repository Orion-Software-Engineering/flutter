// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_login.dart';
import 'package:matchmaking_demo/components/login_signup/login_signup_scaffold.dart';
import 'package:matchmaking_demo/components/login_signup/title_and_subtext.dart';
import 'package:matchmaking_demo/models/login_model.dart';
import 'package:matchmaking_demo/models/progress_popup.dart';
import '../components/login_signup/custom_password_field.dart';
import '../utils/constants.dart';

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
  bool isApiCallProcess = false;
  late LoginRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Progress(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: _ui(context),
    );
  }

  Widget _ui(BuildContext context) {
    //LoginRequestModel requestModel=new LoginRequestModel(email: email,password: password);
    return LogInSignUpScaffold(
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
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: signUpLoginTextFieldTextStyle,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: signUpLoginTextColor,
                            ),
                          ),
                        ),
                        onSaved: (value) => requestModel.username = value!,
                        validator: (value) {
                          if (userNameValid.hasMatch(value!) &&
                              value.isNotEmpty) {
                            String username = value;
                            setState(() {
                              requestModel.username = username;
                            });
                            return null;
                          } else {
                            return "Enter a valid username address";
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
                            primary: Colors.black,
                            // padding: EdgeInsets.fromLTRB(190.0, 10.0, 190.0, 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )),
                        onPressed: () {
                          if (validateAndSave()) {
                            setState(() {
                              isApiCallProcess = true;
                            });
                            APIService apiService = new APIService();
                            apiService.login(requestModel).then((value) {
                              setState(() {
                                isApiCallProcess = false;
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Login Successful')));
                                Navigator.pushNamed(context, '/home');
                              });
                            });
                            print(requestModel.toJson());
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot_password');
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: signUpLoginOrange,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                                decoration: TextDecoration.underline,
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
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/sign_up');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color(0xFFcd5d27),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: Divider(
                            color: Colors.black,
                          )),
                          Text("    Sign In With    "),
                          Expanded(
                              child: Divider(
                            color: Colors.black,
                          )),
                        ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Image(
                              image: AssetImage(
                                'assets/images/sign_in/logo_apple.png',
                              ),
                              height: 44,
                              width: 45,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                  'assets/images/sign_in/logo_outlook.png',
                                  height: 44,
                                  width: 45)),
                          TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                  'assets/images/sign_in/logo_google.png',
                                  height: 44,
                                  width: 45))
                        ],
                      )
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
}
