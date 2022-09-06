import 'package:flutter/material.dart';
import 'package:matchmaking_demo/settings/about_page.dart';
import 'package:matchmaking_demo/settings/privacy_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  // bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 1, right: 16),
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              print('account');
            },
            leading: Icon(Icons.account_circle, color: Colors.black),
            title: Text('Account', style: TextStyle(color: Colors.black)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          ListTile(
            onTap: () {
              print('privacy');
              Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => const PrivacyPage()));
            },
            leading: Icon(Icons.visibility_off, color: Colors.black),
            title: Text('Privacy', style: TextStyle(color: Colors.black)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          SwitchListTile(
            activeTrackColor: Colors.black,
            inactiveThumbColor: Colors.black,
            //fix activeThumbColor
            inactiveTrackColor: Colors.grey,
            value: true,
            onChanged: (bool value) {
              print('dark');
            },
            title: const Text(
              'Dark Mode',
              style: TextStyle(color: Colors.black),
            ),
            secondary: const Icon(Icons.dark_mode, color: Colors.black),
          ),
          ListTile(
            onTap: () {
              print('insights');
            },
            leading: Icon(Icons.insights, color: Colors.black),
            title: Text('Insights', style: TextStyle(color: Colors.black)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          ListTile(
            onTap: () {
              print('about');
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
            leading: Icon(Icons.info, color: Colors.black),
            title: Text('About', style: TextStyle(color: Colors.black)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          ListTile(
            onTap: () {
              print('contact');
            },
            leading: Icon(Icons.support_agent, color: Colors.black),
            title:
                Text('Contact Support', style: TextStyle(color: Colors.black)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          Divider(
            thickness: 0.1,
            color: Colors.black,
          ),
          ListTile(
            onTap: () {
              print('logout');
            },
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: Container(
                //color: Colors.white,
                ),
          ),
          ListTile(
            onTap: (){
              print('delete');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            tileColor: Colors.red[600],
            textColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Delete Account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
