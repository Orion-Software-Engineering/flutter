/*
* HomeScaffold holds the entire layout for the app (ie. Home screen, messages screen, events screen, etc
* The AppBar and Bottom NavigationBar exist in this script
* The various pages are found in the tabs list and are selected based on the value _currentIndex holds
* TODO:Theme mode toggling btn dark and light modes
*  */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchmaking_demo/api/api_service_events.dart';
import 'package:matchmaking_demo/api/api_service_location.dart';
import 'package:matchmaking_demo/api/api_service_profile.dart';
import 'package:matchmaking_demo/components/login_signup/custom_back_button.dart';
import 'package:matchmaking_demo/home/event_page.dart';
import 'package:matchmaking_demo/home/settings_page.dart';
import 'package:matchmaking_demo/models/profile/profile_model.dart';
import 'package:matchmaking_demo/splash/splash_screen.dart';
import '../../home/chat_room_page.dart';
import '../../home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:matchmaking_demo/models/location_model.dart';

// ignore: must_be_immutable
class HomeScaffold extends StatefulWidget {
  final double iconSize = 24.0;

  HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int _currentIndex = 0;
  String? userId;
  Position? userPosition;

  void getCurrentPosition() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
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
    });
  }

  void getAndSaveProfile() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    ProfileResponseModel profileResponseModel = ProfileResponseModel();
    userId = sharedPreferences.getString("userId");
    ProfileApiService profileApiService = ProfileApiService();
    profileApiService.getProfile(userId!).then((value) {
      profileResponseModel = profileApiService.profileResponseModel;
      sharedPreferences.setString("bio", profileResponseModel.bio!);
      sharedPreferences.setString("email", profileResponseModel.email!);
      sharedPreferences.setString("dob", profileResponseModel.dateOfBirth!);
      sharedPreferences.setBool("gender", profileResponseModel.gender!);
      sharedPreferences.setStringList(
          "interests", profileResponseModel.interests!);
    });
  }

  Future<Position> askLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        allowLocation = false;
        return Future.error("Location permission denied");
      }
    }
    allowLocation = true;
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  void goHome() {
    setState(() {
      _currentIndex = 0;
    });
  }

  late LocationPostModel postModel;

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
    getAndSaveProfile();
  }

  @override
  Widget build(BuildContext context) {
    final titles = <List<Widget>>[
      [
        Text(
          'Matching',
          style: TextStyle(
              fontFamily: "Nunito",
              color: Theme.of(context).primaryTextTheme.bodyText1?.color,
              fontSize: 32,
              fontWeight: FontWeight.w700),
        ),
      ],
      [
        Text(
          'Messages',
          style: TextStyle(
              fontFamily: "Nunito",
              color: Theme.of(context).primaryTextTheme.bodyText1?.color,
              fontSize: 32,
              fontWeight: FontWeight.w700),
        ),
        FaIcon(
          FontAwesomeIcons.solidBell,
          color: Color(0xFFFFBA00),
        )
      ],
      [
        Text(
          'Events',
          style: TextStyle(
              fontFamily: "Nunito",
              color: Theme.of(context).primaryTextTheme.bodyText1?.color,
              fontSize: 32,
              fontWeight: FontWeight.w700),
        ),
        FaIcon(
          FontAwesomeIcons.solidBell,
          color: Color(0xFFFFBA00),
        )
      ],
      [
        Text(
          'Settings',
          style: TextStyle(
              fontFamily: "Nunito",
              color: Theme.of(context).primaryTextTheme.bodyText1?.color,
              fontSize: 32,
              fontWeight: FontWeight.w700),
        ),
        FaIcon(
          FontAwesomeIcons.solidBell,
          color: Color(0xFFFFBA00),
        )
      ]
    ];
    final tabs = <Widget>[
      HomePage(),
      ChatRoom(home: goHome),
      EventsPage(),
      SettingsPage()
    ];
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) {
          SystemNavigator.pop();
        } else {
          goHome();
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0.5,
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: titles[_currentIndex],
          ),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 50,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          currentIndex: _currentIndex,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            // BottomNavigationBarItem(icon: )
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                  size: widget.iconSize,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Theme.of(context).indicatorColor,
                  size: widget.iconSize,
                ),
                label: 'Home',
                backgroundColor: Theme.of(context).bottomAppBarTheme.color),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                  size: widget.iconSize,
                ),
                activeIcon: Icon(
                  Icons.chat_bubble,
                  color: Theme.of(context).indicatorColor,
                  size: widget.iconSize,
                ),
                label: 'Chat Room',
                backgroundColor: Theme.of(context).bottomAppBarTheme.color),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.newspaper,
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                  size: widget.iconSize,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.solidNewspaper,
                  color: Theme.of(context).indicatorColor,
                  size: widget.iconSize,
                ),
                label: 'News',
                backgroundColor: Theme.of(context).bottomAppBarTheme.color),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.sliders,
                  color: Theme.of(context).appBarTheme.iconTheme?.color,
                  size: widget.iconSize,
                ),
                activeIcon: FaIcon(
                  FontAwesomeIcons.sliders,
                  color: Theme.of(context).indicatorColor,
                  size: widget.iconSize,
                ),
                label: 'Settings',
                backgroundColor: Theme.of(context).bottomAppBarTheme.color),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
