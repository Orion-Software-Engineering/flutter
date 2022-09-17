import 'package:flutter/material.dart';
import 'package:matchmaking_demo/settings/about_page.dart';
import 'package:matchmaking_demo/settings/privacy_page.dart';
import 'package:matchmaking_demo/utils/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: EdgeInsets.only(left: 16, top: 1, right: 16),
      child: ListView(
        children: [
          ListTile(
            tileColor: Theme.of(context).primaryColor,
            onTap: () {
              print('account');
            },
            leading: Icon(Icons.account_circle,
                color: Theme.of(context).iconTheme.color),
            title: Text('Account',
                style: TextStyle(
                    color:
                        Theme.of(context).primaryTextTheme.bodyText1?.color)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          ListTile(
            tileColor: Theme.of(context).primaryColor,
            onTap: () {
              print('privacy');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PrivacyPage()));
            },
            leading: Icon(Icons.visibility_off,
                color: Theme.of(context).iconTheme.color),
            title: Text('Privacy',
                style: TextStyle(
                    color:
                        Theme.of(context).primaryTextTheme.bodyText1?.color)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          SwitchListTile(
            tileColor: Theme.of(context).primaryColor,
            activeTrackColor: Colors.lightBlue[900],
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
            value: themeChange.darkTheme,
            onChanged: (value) {
              setState(() {
                themeChange.darkTheme = value;
                print(themeChange.darkTheme);
              });
            },
            title: Text(
              'Dark Mode',
              style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.bodyText1?.color),
            ),
            secondary:
                Icon(Icons.dark_mode, color: Theme.of(context).iconTheme.color),
          ),
          ListTile(
            tileColor: Theme.of(context).primaryColor,
            onTap: () {
              print('insights');
            },
            leading:
                Icon(Icons.insights, color: Theme.of(context).iconTheme.color),
            title: Text('Insights',
                style: TextStyle(
                    color:
                        Theme.of(context).primaryTextTheme.bodyText1?.color)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          ListTile(
            tileColor: Theme.of(context).primaryColor,
            onTap: () {
              print('about');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
            leading: Icon(Icons.info, color: Theme.of(context).iconTheme.color),
            title: Text('About',
                style: TextStyle(
                    color:
                        Theme.of(context).primaryTextTheme.bodyText1?.color)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          ListTile(
            tileColor: Theme.of(context).primaryColor,
            onTap: () {
              print('contact');
            },
            leading: Icon(Icons.support_agent,
                color: Theme.of(context).iconTheme.color),
            title: Text('Contact Support',
                style: TextStyle(
                    color:
                        Theme.of(context).primaryTextTheme.bodyText1?.color)),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          Divider(
            thickness: 0.1,
            color: Theme.of(context).iconTheme.color,
          ),
          ListTile(
            onTap: () {
              print('logout');
            },
            leading: Icon(
              Icons.logout_outlined,
              color: Theme.of(context).iconTheme.color,
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
            onTap: () {
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
