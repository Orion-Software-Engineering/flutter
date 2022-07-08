import 'package:flutter/material.dart';
import 'package:matchmaking_demo/constants.dart';

class CustomPasswordField extends StatefulWidget {
  CustomPasswordField(
      {required this.hintText, required this.validationFunction});
  String? hintText;
  FormFieldValidator<String> validationFunction;

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
            labelText: widget.hintText,
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
          validator: widget.validationFunction,
        ),
      ],
    );
  }
}
