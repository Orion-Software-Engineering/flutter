// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'dart:core';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matchmaking_demo/components/login_signup/login_signup_scaffold.dart';
import 'package:matchmaking_demo/models/progress_popup.dart';
import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_signup.dart';
import 'package:matchmaking_demo/models/signup_model.dart';
import '../components/login_signup/custom_password_field.dart';
import '../components/login_signup/date_of_birth.dart';
import '../components/login_signup/title_and_subtext.dart';
import '../utils/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

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
  String? dateValue;
  bool gender = true;

  @override
  void initState() {
    super.initState();
    requestModel = SignupRequestModel();
    responseModel = SignupResponseModel();
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
    return LogInSignUpScaffold(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: TitleAndSubtext(
                    title: 'Sign Up',
                    subtext: 'Create your account to start matching'),
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
                        keyboardType: TextInputType.emailAddress,
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

                      //Password field
                      CustomPasswordField(
                        hintText: 'Password',
                        validationFunction: (value) {
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

                      //Confirm Password Field
                      CustomPasswordField(
                        hintText: 'Confirm Password',
                        validationFunction: (value) {
                          if (value == password) {
                            return null;
                          } else {
                            return "Passwords don't match";
                          }
                        },
                      ),

                      DobField(validationFunction: (value) {
                        requestModel.dob = value!;
                        return null;
                      }),
                      Container(
                        width: 500,
                        child: Row(
                          children: [
                            Container(
                              width: 110.0,
                              child: RadioListTile(
                                  title: Text(
                                    "Male",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      color: Colors.grey,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  value: true,
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = true;
                                    });
                                  }),
                            ),
                            Container(
                              width: 110.0,
                              child: RadioListTile(
                                  title: Text(
                                    "Female",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      color: Colors.grey,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(0),
                                  value: false,
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = false;
                                    });
                                  }),
                            ),
                          ],
                        ),
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
                            APIService apiService = APIService();
                            apiService.signup(requestModel).then((value) {
                              setState(() {
                                isApiCallProcess = false;
                                if (statusCode == 201) {
                                  Navigator.pushNamed(context, '/interests_1');
                                } else {
                                  Fluttertoast.showToast(
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      msg: message,
                                      fontSize: 16);
                                }
                              });
                            });
                          }
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
                              Navigator.pushNamed(context, '/login');
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
