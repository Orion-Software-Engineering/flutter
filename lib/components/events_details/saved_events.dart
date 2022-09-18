import 'package:flutter/material.dart';

class SavedEvents extends StatelessWidget {
  const SavedEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.00),
            child: Text(
              'My Saved Events',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ],
      ),
    );
  }
}
