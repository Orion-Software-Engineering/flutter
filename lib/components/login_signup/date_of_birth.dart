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

  //TODO this _bLogicDateValue has the date format required for the backend stuff
  String? _bLogicDateValue;
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
            _bLogicDateValue = date.toString().substring(0, 10);
            dateValue = dateFormat.format(date!).substring(0, 10);
          });
        });
        // TODO Picker starts from Jan 1 of 2004. You have to make it include the days between Jan 1 and now
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
