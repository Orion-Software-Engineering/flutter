// ignore_for_file: prefer_const_constructors
//import 'passwordfield.dart'
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp userNameValid = RegExp(
      r"^[a-zA-Z0-9_]*$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        width: double.infinity,
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                  child: Text('Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50.0,
                    ),),
                ),
                Container(
                  child: Text('Create your account to start matching',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                  ),),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
                  ),
                  validator: (value) {
                    if (userNameValid.hasMatch(value!) && value.isNotEmpty) {
                      return null;
                    } else {
                      return "Username should be alphanumeric";
                    }
                  },
                ),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                    ),
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
                      padding: EdgeInsets.fromLTRB(190.0, 10.0, 190.0, 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      )
                    ),
                    onPressed: () {
                      if (!_formKey!.currentState!.validate()) {
                        return;
                      }
                    },
                    child: Text('SIGN UP',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),),
                ),
                SizedBox(height: 30.0),
                Container(
                  child: Text('Already have an account?',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}