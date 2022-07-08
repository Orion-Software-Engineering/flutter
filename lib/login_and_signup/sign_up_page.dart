import 'package:flutter/material.dart';
import 'package:matchmaking_demo/constants.dart';
import 'package:matchmaking_demo/login_and_signup/components/title_and_subtext.dart';
// import 'package:date_field/date_field.dart';
import 'components/custom_password_field.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp userNameValid = RegExp(r"^[a-zA-Z0-9_]*$");
  late String userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/sign_in/Sign Up bg.png'),
              fit: BoxFit.cover),
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
                  child: TitleAndSubtext(
                      title: 'Sign Up',
                      subtext: 'Create your account to start matchmaking'),
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
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                            )),
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
                        SizedBox(height: 50.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              // padding: EdgeInsets.fromLTRB(190.0, 10.0, 190.0, 10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )),
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
}
