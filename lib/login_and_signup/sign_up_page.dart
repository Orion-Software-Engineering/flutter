import 'package:flutter/material.dart';
import 'package:matchmaking_demo/constants.dart';
import 'package:matchmaking_demo/login_and_signup/components/login_signup_scaffold.dart';
import 'package:matchmaking_demo/login_and_signup/components/title_and_subtext.dart';
import 'package:matchmaking_demo/login_and_signup/components/date_of_birth.dart';
import 'components/custom_password_field.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp userNameValid = RegExp(r"^[a-zA-Z0-9_]*$");
  late String userPassword;
  // final datePick = await

  @override
  Widget build(BuildContext context) {
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
                    subtext: 'Create your account to start matchmaking'),
              ),
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
                          border: inputBorder,
                        ),
                        validator: (value) {
                          if (userNameValid.hasMatch(value!) &&
                              value.isNotEmpty) {
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
                          border: inputBorder,
                        ),
                        validator: (value) {
                          if (emailValid.hasMatch(value!)) {
                            return null;
                          } else {
                            return "Enter a valid email address";
                          }
                        },
                      ),
                      CustomPasswordField(
                        hintText: 'Password',
                        validationFunction: (value) {
                          if (value!.length >= 8) {
                            userPassword = value;
                            return null;
                          } else {
                            return "Password must be at least 8 characters long";
                          }
                        },
                      ),
                      CustomPasswordField(
                        hintText: 'Confirm Password',
                        validationFunction: (value) {
                          if (value == userPassword) {
                            return null;
                          } else {
                            return "Passwords don't match";
                          }
                        },
                      ),
                      DobField(),
                      //TODO DOB
                      SizedBox(height: 50.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: signUpLoginButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 0.0),
                          child: Center(
                            child: Text(
                              'SIGN UP',
                              style: loginSignUpButtonTextStyle,
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
                              style: signUpLoginTextButtonStyleOrange,
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
}
