// ignore_for_file: prefer_const_constructors
//import 'passwordfield.dart'
import 'dart:core';

import 'package:matchmaking_demo/models/progress_popup.dart';
import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_signup.dart';
import 'package:matchmaking_demo/models/signup_model.dart';
import 'constants.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  RegExp userNameValid = RegExp(r"^[a-zA-Z0-9_]*$");
  bool masked = true;
  bool confirmMasked = true;
  String password = '';
  late SignupRequestModel requestModel;
  late SignupResponseModel responseModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = new SignupRequestModel();
    responseModel = new SignupResponseModel();
  }

  @override
  Widget build(BuildContext context) {
    return Progress(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: _ui(context),
    );
  }

  @override
  Widget _ui(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sign_in/Sign Up bg.png'),
              fit: BoxFit.fill),
        ),
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 70.0, 20.0, 50.0),
        width: double.infinity,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Create your account to start matching',
                        style: TextStyle(
                          color: signUpLoginTextColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  flex: 4,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
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
                              return "Username should be alphanumeric";
                            }
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: signUpLoginTextFieldTextStyle,
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                          ),
                          onSaved: (value) => requestModel.username = value!,
                          validator: (value) {
                            if (emailValid.hasMatch(value!)) {
                              String email = value;
                              setState(() {
                                requestModel.email = email;
                              });
                              return null;
                            } else {
                              return "Enter a valid email address";
                            }
                          },
                        ),
                        TextFormField(
                          obscureText: masked,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: signUpLoginTextFieldTextStyle,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  masked = !masked;
                                });
                              },
                              icon: Icon((masked == true)
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              // icon: Icon(Icons.visibility),
                              color: Color(
                                  (masked == true) ? 0xFF8c8c8c : 0xFFcd5d27),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                          ),
                          validator: (value) {
                            if (value!.length >= 8) {
                              setState(() => password = value);
                              setState(() {
                                requestModel.password = password;
                              });
                              return null;
                            } else {
                              return "Password must be at least 8 characters long";
                            }
                          },
                        ),
                        TextFormField(
                          obscureText: confirmMasked,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: signUpLoginTextFieldTextStyle,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  confirmMasked = !confirmMasked;
                                });
                              },
                              icon: Icon((confirmMasked == true)
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              // icon: Icon(Icons.visibility),
                              color: Color((confirmMasked == true)
                                  ? 0xFF8c8c8c
                                  : 0xFFcd5d27),
                            ),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                          ),
                          validator: (value) {
                            if (value == password) {
                              return null;
                            } else {
                              return "Passwords don't match";
                            }
                          },
                        ),
                        SizedBox(height: 50.0),
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
                              apiService.signup(requestModel).then((value) {
                                setState(() {
                                  isApiCallProcess = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Signup Successful')));
                                });
                              });
                            }
                            print(requestModel.toJson());
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 0.0),
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Login',
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
