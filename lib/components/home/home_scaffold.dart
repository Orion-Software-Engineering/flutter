/*
* HomeScaffold holds the entire layout for the app (ie. Home screen, messages screen, events screen, etc
* The AppBar and Bottom NavigationBar exist in this script
* The various pages are found in the tabs list and are selected based on the valuw _currentIndex holds
* TODO:Theme mode toggling btn dark and light modes
*  */

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchmaking_demo/components/home/avatar_placeholder.dart';
import 'package:matchmaking_demo/home/event_page.dart';
import 'package:matchmaking_demo/home/settings_page.dart';
import '../../home/chat_room_page.dart';
import '../../home/home_page.dart';

class HomeScaffold extends StatefulWidget {
  final double iconSize = 24.0;

  const HomeScaffold({Key? key}) : super(key: key);

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int _currentIndex = 0;

  final tabs = <Widget>[HomePage(), ChatRoom(), EventsPage(), SettingsPage()];

  final titles = <String>['Matching', 'Messages', 'Events', 'Settings'];
  @override
  Widget build(BuildContext context) {
    IconData changeThemeIcon =
        (MediaQuery.of(context).platformBrightness == Brightness.light)
            ? FontAwesomeIcons.solidSun
            : FontAwesomeIcons.solidMoon;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const <Color>[Color(0xFFFF0000), Color(0xFF0000FF)],
            ),
          ),
        ),
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0x80FFFFFF),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: FaIcon(
                  changeThemeIcon,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        title: Center(
          child: Text(titles[_currentIndex]),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AvatarPlaceholder(),
          ),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
                color: Colors.black,
                size: widget.iconSize,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
                size: widget.iconSize,
              ),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                color: Colors.black,
                size: widget.iconSize,
              ),
              activeIcon: Icon(
                Icons.chat_bubble,
                color: Colors.black,
                size: widget.iconSize,
              ),
              label: 'Chat Room',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.newspaper,
                color: Colors.black,
                size: widget.iconSize,
              ),
              activeIcon: FaIcon(
                FontAwesomeIcons.solidNewspaper,
                color: Colors.black,
                size: widget.iconSize,
              ),
              label: 'News',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.sliders,
                color: Colors.black,
                size: widget.iconSize,
              ),
              activeIcon: FaIcon(
                FontAwesomeIcons.sliders,
                color: Colors.black,
                size: widget.iconSize,
              ),
              label: 'Settings',
              backgroundColor: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
