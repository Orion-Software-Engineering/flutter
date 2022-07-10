import 'package:flutter/material.dart';
import 'package:matchmaking_demo/constants.dart';

class DobField extends StatefulWidget {
  @override
  State<DobField> createState() => _DobFieldState();
}

class _DobFieldState extends State<DobField> {
  DateTime? _dateTime;
  String? dateValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          prefixText: dateValue,
          labelText: 'DD/MM/YYYY',
          labelStyle: signUpLoginTextFieldTextStyle,
          border: inputBorder,
          suffixIcon: GestureDetector(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: new DateTime(DateTime.now().year - 18),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(DateTime.now().year - 18))
                    .then((date) {
                  setState(() {
                    _dateTime = date;
                    dateValue = _dateTime.toString().substring(0, 10);
                  });
                  print(date);
                });
                //TODO What's left is showing the date selected without the user having to tap on the field.
                // TODO Picker starts from Jan 1 of 2004. You have to make it include the days between Jan 1 and now
              },
              child: Icon(Icons.calendar_month))),
    );
  }
}
