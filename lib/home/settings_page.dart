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
          GestureDetector(
            onTap: () {
              print('account');
            },
            child: Row(
              children: const [
                Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                Text('Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              print('privacy');
            },
            child: Row(
              children: const [
                Icon(
                  Icons.visibility_off,
                  color: Colors.black,
                ),
                Text('Privacy',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              print('dark mode');
            },
            child: Row(
              children: [
                Icon(
                  Icons.dark_mode,
                  color: Colors.black,
                ),
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Transform.scale(
                    scale: 0.65,
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (bool val) {},
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              print('insights');
            },
            child: Row(
              children: const [
                Icon(
                  Icons.insights,
                  color: Colors.black,
                ),
                Text('Insights',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              print('about');
            },
            child: Row(
              children: const [
                Icon(
                  Icons.info,
                  color: Colors.black,
                ),
                Text('About Us',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              print('contact');
            },
            child: Row(
              children: const [
                Icon(
                  Icons.support_agent,
                  color: Colors.black,
                ),
                Text('Contact Support',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Center(
            child: OutlinedButton(
              //style: ButtonStyle.foregroundColor, fix
              //padding: EdgeInsets.symmetric(horizontal: 40),
              //shape: RoundedRectangleBorder(
              //borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              child: Text(
                "Delete Account",
                style: TextStyle(
                    fontSize: 16, letterSpacing: 2.2, color: Colors.red),
              ),
            ),
          ),
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
