import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_location.dart';
import 'package:matchmaking_demo/models/location_model.dart';
import 'package:matchmaking_demo/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

// bool private = allowLocation!;

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  String? userId;
  Position? userPosition;
  bool? private = allowLocation;
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
            inactiveTrackColor: Colors.grey,
            tileColor: Colors.grey[400],
            value: private!,
            onChanged: (bool value) {
              print(value);
              if (value) {
                getCurrentPosition();
                if (!allowLocation!) {
                  setState(() {
                    private = false;
                  });
                } else {
                  setState(() {
                    private = true;
                  });
                }
              } else {
                setState(() {
                  private = false;
                  allowLocation = false;
                });
                saveLocationPermission(allowLocation!);
              }
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

  // Future setLocationPermission() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   sharedPreferences.setBool("allowLocation", allowLocation!);
  // }
  Future saveLocationPermission(bool value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    print("home $allowLocation");
    sharedPreferences.setBool("allowLocation", value);
  }

  Future<Position> askLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("home2 $allowLocation");
        setState(() {
          allowLocation = false;
          saveLocationPermission(allowLocation!);
          print("home2 $allowLocation");
        });
        print("home2 $allowLocation");
        return Future.error("Location permission denied");
      }
    }
    setState(() {
      allowLocation = false;
      saveLocationPermission(allowLocation!);
      print("home2 $allowLocation");
    });
    print("here");
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  void getCurrentPosition() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    late LocationPostModel postModel;
    userId = sharedPreferences.getString("userId");
    Position position = await askLocationPermission();
    setState(() {
      userPosition = position;
      postModel = LocationPostModel();
      postModel.userID = userId!;
      postModel.latitude = userPosition!.latitude.toStringAsFixed(6).toString();
      postModel.longitude =
          userPosition!.longitude.toStringAsFixed(6).toString();
      print(postModel);
      LocationAPIService apiService = LocationAPIService();
      apiService.location(postModel).then((value) => null);
      allowLocation = true;
      saveLocationPermission(allowLocation!);
      print("home3 $allowLocation");
    });
  }
}
