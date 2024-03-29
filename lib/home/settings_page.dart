// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/login/login_page.dart';
import 'package:matchmaking_demo/models/delete_model.dart';
import 'package:matchmaking_demo/settings/privacy_page.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/dark_theme_provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

IconData? systemIcon;
bool displayThemeSettings = true;
DeleteAccountRequestModel requestModel = DeleteAccountRequestModel();

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? userId;
  void getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("userId");
  }

  Future<void> _launchUrl(String url, String path) async {
    final Uri uri = Uri(scheme: "https", host: url, path: path);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Cannot launch url";
    }
  }

  Future<void> getUserInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    requestModel.username = sharedPreferences.getString("username")!;
    requestModel.userId = sharedPreferences.getString("userId")!;
    requestModel.password = sharedPreferences.getString("password")!;
  }

  Future<void> deleteLoginCredentials() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove("username");
    sharedPreferences.remove("password");
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    switch (themeChange.darkTheme) {
      case ThemeMode.dark:
        systemIcon = Icons.dark_mode;
        break;
      case ThemeMode.light:
        systemIcon = Icons.light_mode;
        break;
      case ThemeMode.system:
        systemIcon = Icons.settings;
        break;
    }
    return Container(
      padding: EdgeInsets.only(left: 16, top: 1, right: 16),
      child: ListView(
        children: [
          ListTile(
            tileColor: Theme.of(context).primaryColor,
            onTap: () {
              Navigator.of(context).goToProfile(userId);
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
          ListTile(
            leading: Icon(systemIcon, color: Theme.of(context).iconTheme.color),
            title: Text(
              'Theme',
              style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.bodyText1?.color),
            ),
            onTap: () {
              setState(() {
                displayThemeSettings = !displayThemeSettings;
                print(displayThemeSettings);
              });
            },
          ),
          Offstage(
            offstage: displayThemeSettings,
            child: Card(
              elevation: 0,
              color: Theme.of(context).primaryColor,
              child: Theme(
                data: ThemeData(
                    unselectedWidgetColor:
                        Theme.of(context).primaryTextTheme.bodyText2?.color),
                child: Column(
                  children: [
                    RadioListTile(
                        title: Text(
                          'Dark Mode',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  ?.color),
                        ),
                        value: ThemeMode.dark,
                        groupValue: themeChange.darkTheme,
                        onChanged: (value) {
                          setState(() {
                            themeChange.darkTheme = ThemeMode.dark;
                            systemIcon = Icons.dark_mode;
                          });
                        }),
                    RadioListTile(
                        title: Text(
                          'Light Mode',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  ?.color),
                        ),
                        value: ThemeMode.light,
                        groupValue: themeChange.darkTheme,
                        onChanged: (value) {
                          setState(() {
                            themeChange.darkTheme = ThemeMode.light;
                            systemIcon = Icons.light_mode;
                          });
                        }),
                    RadioListTile(
                        title: Text(
                          'System Theme',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  ?.color),
                        ),
                        value: ThemeMode.system,
                        groupValue: themeChange.darkTheme,
                        onChanged: (value) {
                          setState(() {
                            themeChange.darkTheme = ThemeMode.system;
                            systemIcon = Icons.settings;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            tileColor: Theme.of(context).primaryColor,
            onTap: () {
              _launchUrl('orionmeet.vercel.app', '/about');
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
              _launchUrl('orionmeet.vercel.app', '/support');
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
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        elevation: 80,
                        backgroundColor: Theme.of(context).primaryColor,
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  ?.color),
                        ),
                        content: Text(
                          "Are you sure you want to logout?",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  ?.color),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                              deleteLoginCredentials();
                              OneSignal.shared.removeExternalUserId();
                            },
                            child: Text("OK"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ],
                      ));
            },
            leading: Icon(
              Icons.logout_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Log out',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Container(
                //color: Colors.white,
                ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        elevation: 80,
                        backgroundColor: Theme.of(context).primaryColor,
                        title: Text(
                          'Delete Account',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  ?.color),
                        ),
                        content: Text(
                          "Do you wish to delete your account?",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  ?.color),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.of(context).goToDelete();
                            },
                            child: Text("OK"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ],
                      ));
              //Navigator.push(context,
              //MaterialPageRoute(builder: (context) => const SignUp()));
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
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
