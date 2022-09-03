import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView(
      children: [
        SwitchListTile(
          activeTrackColor: Colors.black,
          inactiveThumbColor: Colors.black,
          //fix activeThumbColor
          inactiveTrackColor: Colors.grey,
          value: true,
          onChanged: (bool value) {
            print('location tapped');
          },
          title: const Text(
            'Enable location based matching',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}