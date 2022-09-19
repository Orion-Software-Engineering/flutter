import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../splash/splash_screen.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {Key? key, required this.hintText, required this.validationFunction})
      : super(key: key);
  final String? hintText;
  //validateFunction was a necessary property because the field was to be used in 2 ways.
  //1. To check password validity
  //2. To check that the password entered for confirm password matches.
  final FormFieldValidator<String> validationFunction;

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
          enableSuggestions: false,
          style: TextStyle(
            color: Theme.of(context).primaryTextTheme.bodyText1?.color,
          ),
          keyboardType: TextInputType.emailAddress,
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
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: themeMode ? Colors.white : Colors.grey,
              ),
            ),
          ),
          validator: widget.validationFunction,
        ),
      ],
    );
  }
}
