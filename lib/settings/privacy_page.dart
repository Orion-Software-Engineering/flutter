import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SwitchListTile(
            activeTrackColor: Colors.black,
            inactiveThumbColor: Colors.black,
            //fix activeThumbColor
            inactiveTrackColor: Colors.grey,
            tileColor: Colors.grey[400],
            value: false,
            onChanged: (bool value) {
              print('location tapped');
            },
            title: const Text(
              'Enable location based matching',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
