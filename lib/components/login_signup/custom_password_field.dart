import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {Key? key, required this.hintText, required this.validationFunction})
      : super(key: key);
  final String? hintText;
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
            border: inputBorder,
          ),
          validator: widget.validationFunction,
        ),
      ],
    );
  }
}
