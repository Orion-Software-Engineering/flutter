// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_forgotpassword.dart';
import 'package:matchmaking_demo/components/login_signup/custom_back_button.dart';
import 'package:matchmaking_demo/components/login_signup/login_signup_scaffold.dart';
import 'package:matchmaking_demo/components/login_signup/title_and_subtext.dart';
import 'package:matchmaking_demo/models/forgot_password_model.dart';
import 'package:matchmaking_demo/models/progress_popup.dart';
import '../utils/constants.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool isApiCallProcess = false;
  late ForgotPasswordRequestModel requestModel;

  @override
  void initState() {
    super.initState();
    requestModel = new ForgotPasswordRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Progress(
      isLoading: isApiCallProcess,
      opacity: 0.3,
      child: _ui(context),
    );
  }

  Widget _ui(BuildContext context) {
    return LogInSignUpScaffold(
      key: scaffoldKey,
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomBackButton(),
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 30.0,
                ),
              ),
              Expanded(
                flex: 3,
                child: TitleAndSubtext(
                    title: 'Forgot your\npassword huh?',
                    subtext: 'A password-reset link will be sent to your mail'),
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
                          labelText: 'Email',
                          labelStyle: signUpLoginTextFieldTextStyle,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: signUpLoginTextColor,
                            ),
                          ),
                        ),
                        onSaved: (value) => requestModel.email = value!,
                        validator: (value) {
                          if (emailValid.hasMatch(value!) && value.isNotEmpty) {
                            String username = value;
                            setState(() {
                              requestModel.email = username;
                            });
                            return null;
                          } else {
                            return "Enter a valid email address";
                          }
                        },
                      ),
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
                            ForgotPasswordAPIService apiService =
                                new ForgotPasswordAPIService();
                            apiService.password(requestModel).then((value) {
                              setState(() {
                                isApiCallProcess = false;
                                if (statusCode == 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Email sent')));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Could not reset password. Try again later')));
                                }
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
                              'SUBMIT',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
}
