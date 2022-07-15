import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchmaking_demo/home/add_page.dart';
import 'package:matchmaking_demo/home/news_page.dart';
import 'package:matchmaking_demo/home/settings_page.dart';

import '../../home/chat_room_page.dart';
import '../../home/home_page.dart';

class HomeScaffold extends StatefulWidget {
  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int _currentIndex = 0;

  final tabs = <Widget>[
    HomePage(),
    ChatRoom(),
    AddPage(),
    NewsPage(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: _currentIndex,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(icon: )
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.black),
              activeIcon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline, color: Colors.black),
              activeIcon: Icon(Icons.chat_bubble, color: Colors.black),
              label: 'Chat Room',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.circlePlus,
                  size: 37, color: Colors.black),
              label: 'Add',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.newspaper, color: Colors.black),
              activeIcon:
                  FaIcon(FontAwesomeIcons.solidNewspaper, color: Colors.black),
              label: 'News',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.sliders, color: Colors.black),
              activeIcon: FaIcon(FontAwesomeIcons.sliders, color: Colors.black),
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
