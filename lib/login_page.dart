// ignore_for_file: prefer_const_constructors
//import 'passwordfield.dart'
import 'package:flutter/material.dart';
import 'constants.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp userNameValid = RegExp(r"^[a-zA-Z0-9_]*$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 100.0, 20.0, 8.0),
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
                SizedBox(height: 80.0),
                Expanded(
                  flex: 4,
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
                      SizedBox(height: 60.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            // padding: EdgeInsets.fromLTRB(190.0, 10.0, 190.0, 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )),
                        onPressed: () {
                          if (!_formKey!.currentState!.validate()) {
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
                      SizedBox(height: 30.0),
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
                            onPressed: () {},
                            child: Text(
                              'Login',
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
                    ],
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
