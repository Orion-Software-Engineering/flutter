import 'package:flutter/material.dart';

import '../components/login_signup/custom_password_field.dart';
import '../components/login_signup/login_signup_scaffold.dart';
import '../components/login_signup/sign_in_with_button.dart';
import '../components/login_signup/title_and_subtext.dart';
import '../utils/constants.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp userNameValid = RegExp(r"^[a-zA-Z0-9_]*$");

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LogInSignUpScaffold(
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: TitleAndSubtext(
                    title: 'Sign In',
                    subtext: 'Enter your email and password',
                  )),
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
                        validator: (value) {
                          if (emailValid.hasMatch(value!) && value.isNotEmpty) {
                            return null;
                          } else {
                            return "Enter a valid email address";
                          }
                        },
                      ),
                      CustomPasswordField(
                          hintText: 'Password',
                          validationFunction: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return 'Enter password';
                            }
                          }),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: signUpLoginOrange, fontSize: 16),
                          )),
                      SizedBox(height: 30.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: signUpLoginButtonColor,
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
                              vertical: 8.0, horizontal: 0.0),
                          child: Center(
                            child: Text(
                              'LOG IN',
                              style: loginSignUpButtonTextStyle,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
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
                                style: signUpLoginTextButtonStyleOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
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
                          SignInWithButton(
                            imagePath: 'assets/images/sign_in/logo_apple.png',
                          ),
                          SignInWithButton(
                            imagePath: 'assets/images/sign_in/logo_outlook.png',
                          ),
                          SignInWithButton(
                            imagePath: 'assets/images/sign_in/logo_google.png',
                          )
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
