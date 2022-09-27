// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matchmaking_demo/api/login_signup_interests/api_service_delete_account.dart';
import 'package:matchmaking_demo/components/login_signup/custom_back_button.dart';
import 'package:matchmaking_demo/components/login_signup/login_signup_scaffold.dart';
import 'package:matchmaking_demo/components/login_signup/title_and_subtext.dart';
import 'package:matchmaking_demo/models/delete_model.dart';
import 'package:matchmaking_demo/models/progress_popup.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/login_signup/custom_password_field.dart';
import '../utils/constants.dart';

DeleteAccountRequestModel requestModel = DeleteAccountRequestModel();

class Delete extends StatefulWidget {
  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  RegExp userNameValid = RegExp(r"^[a-zA-Z0-9_]*$");
  RegExp passwordValid = RegExp(r".+");
  bool isLoading = false;
  String? username;
  String? password;
  Future<void> getUserInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    requestModel.userId = sharedPreferences.getString("userId")!;
  }

  Future<void> clearSharedPreferences() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  void initState() {
    super.initState();
    getUserInfo();
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
              CustomBackButton(
                backColor: Theme.of(context).primaryTextTheme.bodyText1?.color,
              ),
              Expanded(
                flex: 2,
                child: TitleAndSubtext(
                    title: "Aww,leaving?",
                    subtext: 'Confirm your username and password'),
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
                        validator: (value) {
                          if (value!.isNotEmpty &&
                              userNameValid.hasMatch(value)) {
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
                              return 'Enter a valid password';
                            }
                          }),
                      SizedBox(height: 64.0),
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
                            DeleteAccountAPIService apiService =
                                new DeleteAccountAPIService();
                            apiService.delete(requestModel).then((value) {
                              setState(() {
                                isLoading = false;
                                if (statusCode == 200) {
                                  Navigator.of(context).goToSignUpScreen();
                                  clearSharedPreferences();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Account Deleted')));
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
                              'DELETE ACCOUNT',
                              style: TextStyle(
                                fontFamily: "Nunitot",
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
