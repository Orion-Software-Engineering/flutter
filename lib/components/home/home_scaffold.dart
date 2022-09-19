/*
* HomeScaffold holds the entire layout for the app (ie. Home screen, messages screen, events screen, etc
* The AppBar and Bottom NavigationBar exist in this script
* The various pages are found in the tabs list and are selected based on the value _currentIndex holds
* TODO:Theme mode toggling btn dark and light modes
*  */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchmaking_demo/api/api_service_location.dart';
import 'package:matchmaking_demo/components/login_signup/custom_back_button.dart';
import 'package:matchmaking_demo/home/event_page.dart';
import 'package:matchmaking_demo/home/settings_page.dart';
import '../../home/chat_room_page.dart';
import '../../home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:matchmaking_demo/models/location_model.dart';

class HomeScaffold extends StatefulWidget {
  final double iconSize = 24.0;

  const HomeScaffold({Key? key}) : super(key: key);

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int _currentIndex = 1;
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

  Future<Position> askLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  final tabs = <Widget>[HomePage(), ChatRoom(), EventsPage(), SettingsPage()];

  final titles = <String>['Matching', 'Messages', 'Events', 'Settings'];

  late LocationPostModel postModel;

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    IconData changeThemeIcon =
        (MediaQuery.of(context).platformBrightness == Brightness.light)
            ? FontAwesomeIcons.solidSun
            : FontAwesomeIcons.solidMoon;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
            child: Text(titles[_currentIndex]),
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
