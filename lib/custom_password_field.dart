import 'package:flutter/material.dart';
import 'constants.dart';

class CustomPasswordField extends StatefulWidget {
  var userPassword;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool masked = true;
  bool confirmMasked = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              icon: Icon(
                  (masked == true) ? Icons.visibility : Icons.visibility_off),
              // icon: Icon(Icons.visibility),
              color: Color((masked == true) ? 0xFF8c8c8c : 0xFFcd5d27),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            )),
          ),
          validator: (value) {
            if (value!.length >= 8) {
              widget.userPassword = value;
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
              color: Color((confirmMasked == true) ? 0xFF8c8c8c : 0xFFcd5d27),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            )),
          ),
          validator: (value) {
            if (value == widget.userPassword) {
              return null;
            } else {
              return "Passwords don't match";
            }
          },
        )
      ],
    );
  }
}
