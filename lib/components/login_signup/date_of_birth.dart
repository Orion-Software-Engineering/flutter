import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/constants.dart';

class DobField extends StatefulWidget {
  const DobField({Key? key, required this.validationFunction})
      : super(key: key);

  final FormFieldValidator<String> validationFunction;

  @override
  State<DobField> createState() => _DobFieldState();
}

class _DobFieldState extends State<DobField> {
  String? dateValue;

  var dateFormat = DateFormat('dd/MM/yyyy - kk:mm');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime(DateTime.now().year - 18),
                firstDate: DateTime(1900),
                lastDate:
                    DateTime(DateTime.now().year - 18).add(Duration(days: 100)))
            .then((date) {
          setState(() {
            dateValue = dateFormat.format(date!).substring(0, 10);
          });
        });
      },
      child: TextFormField(
        controller: TextEditingController(text: dateValue),
        enabled: false,
        decoration: InputDecoration(
            labelText: dateValue == null ? 'YYYY-MM-DD' : 'Date of Birth',
            labelStyle: signUpLoginTextFieldTextStyle,
            border: inputBorder,
            suffixIcon: Icon(Icons.calendar_month)),
        validator: widget.validationFunction,
      ),
    );
  }
}
