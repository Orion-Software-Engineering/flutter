import 'package:flutter/material.dart';
import 'package:matchmaking_demo/constants.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField();

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool passwordMask = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordMask,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordMask = !passwordMask;
            });
          },
          icon: Icon(
              (passwordMask == true) ? Icons.visibility : Icons.visibility_off),
// icon: Icon(Icons.visibility),
          color: Color((passwordMask == true) ? 0xFF8c8c8c : 0xFFcd5d27),
        ),
        labelText: 'Password',
        labelStyle: signUpLoginTextFieldTextStyle,
        border: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
      ),
      validator: (value) {
        if (value!.length > 8) {
          return null;
        } else {
          return "Password invalid";
        }
      },
    );
  }
}
