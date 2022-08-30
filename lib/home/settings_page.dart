import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 1, right: 16),
      child: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              Icon(
                Icons.person,
                color: Colors.black,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          buildAccountOptionRow(context, "Change password"),
          buildAccountOptionRow(context, "Hide my location"),
          buildAccountOptionRow(context, "Profile"),
          SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Icon(
                Icons.volume_up_outlined,
                color: Colors.green,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Others",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          buildNotificationOptionRow("Read receipt", true),
          buildNotificationOptionRow("Clear chat history", true),
          buildNotificationOptionRow("Dark mode", true),
          buildAccountOptionRow(context, "About"),
          buildAccountOptionRow(context, "Invite a friend"),
          buildAccountOptionRow(context, "FAQ and help"),
          buildAccountOptionRow(context, "Privacy Policy"),
          SizedBox(
            height: 20,
          ),
          Center(
            child: OutlinedButton(
              //padding: EdgeInsets.symmetric(horizontal: 40),
              //shape: RoundedRectangleBorder(
              //    borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Text("SIGN OUT",
                  style: TextStyle(
                      fontSize: 16, letterSpacing: 2.2, color: Colors.red)),
            ),
          )
        ],
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
