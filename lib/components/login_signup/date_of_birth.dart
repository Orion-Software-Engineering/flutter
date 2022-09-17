/*
* the DobField does not allow manual inputs via keyboard
* showDatePicker is used for convenience of the user,
* AND my convenience as well.
* Didn't want to go through the hassle of validating user inputs for date
* since everyone has various formats for writing dates
* */

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
        int dayOfYear = 0;
        switch (DateTime.now().month) {
          case 12:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 334 + DateTime.now().day
                : 335 + DateTime.now().day;
            break;
          case 11:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 304 + DateTime.now().day
                : 305 + DateTime.now().day;
            break;
          case 10:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 273 + DateTime.now().day
                : 274 + DateTime.now().day;
            break;
          case 9:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 243 + DateTime.now().day
                : 244 + DateTime.now().day;
            break;
          case 8:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 212 + DateTime.now().day
                : 213 + DateTime.now().day;
            break;
          case 7:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 181 + DateTime.now().day
                : 182 + DateTime.now().day;
            break;
          case 6:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 151 + DateTime.now().day
                : 152 + DateTime.now().day;
            break;
          case 5:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 120 + DateTime.now().day
                : 121 + DateTime.now().day;
            break;
          case 4:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 90 + DateTime.now().day
                : 91 + DateTime.now().day;
            break;
          case 3:
            dayOfYear += (DateTime.now().year % 4 == 0)
                ? 59 + DateTime.now().day
                : 60 + DateTime.now().day;
            break;
          case 2:
            dayOfYear += 31 + DateTime.now().day;
            break;
          case 1:
            dayOfYear = DateTime.now().day;
            break;
        }
        print(dayOfYear);

        showDatePicker(
                context: context,
                initialDate: DateTime(DateTime.now().year - 18),
                firstDate: DateTime(1900),
                lastDate: DateTime(DateTime.now().year - 18)
                    .add(Duration(days: dayOfYear)))
            .then((date) {
          setState(() {
            dateValue = dateFormat.format(date!).substring(0, 10);
          });
        });
      },
      child: TextFormField(
        style: TextStyle(
          color: Theme.of(context).primaryTextTheme.bodyText1?.color,
        ),
        controller: TextEditingController(text: dateValue),
        enabled: false,
        decoration: InputDecoration(
            labelText: dateValue == null ? 'DD/MM/YYYY' : 'Date of Birth',
            labelStyle: signUpLoginTextFieldTextStyle,
            border: inputBorder,
            suffixIcon: Icon(
              Icons.calendar_month,
              color: Theme.of(context).primaryTextTheme.bodyText2?.color,
            )),
        validator: widget.validationFunction,
      ),
    );
  }
}
