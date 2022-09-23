import 'package:flutter/material.dart';
import 'package:matchmaking_demo/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

bool private = false;

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  Future<void> _launchUrl(String url, String path) async {
    final Uri uri = Uri(scheme: "https", host: url, path: path);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Cannot launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryTextTheme.bodyText1?.color,
        shadowColor: Theme.of(context).primaryTextTheme.bodyText2?.color,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
          ),
        ),
        toolbarHeight: 70,
        title: Center(
          child: Text('Privacy Settings'),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            activeTrackColor: Colors.black,
            inactiveThumbColor: Colors.black,
            //todo fix activeThumbColor
            inactiveTrackColor: Colors.grey,
            tileColor: Colors.grey[400],
            value: private,
            onChanged: (bool value) {
              setState(() {
                print(value);
                private = value;
                allowLocation = value;
                setLocationPermission();
              });
            },
            title: const Text(
              'Enable location based matching',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            tileColor: Theme.of(context).primaryColor,
            onTap: () {
              _launchUrl("pages.flycricket.io", "/orion-meet/privacy.html");
            },
            title: Text('Privacy Policy',
                style: TextStyle(
                    color:
                        Theme.of(context).primaryTextTheme.bodyText1?.color)),
          ),
        ],
      ),
    );
  }

  Future setLocationPermission() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("allowLocation", allowLocation!);
  }
}
