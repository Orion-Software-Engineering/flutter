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

  final tabs = <Widget>[HomePage(), ChatRoom(), NewsPage(), SettingsPage()];

  final titles = <String>['Matching', 'Messages', 'Events', 'Settings'];
  @override
  Widget build(BuildContext context) {
    IconData changeThemeIcon =
        (MediaQuery.of(context).platformBrightness == Brightness.light)
            ? FontAwesomeIcons.solidSun
            : FontAwesomeIcons.solidMoon;

    return Scaffold(
      appBar: AppBar(
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
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child:
                    Image.asset('assets/images/home/user_profile_avatar.png'),
              ),
            ),
          )
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
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(icon: )
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 30,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
                size: 30,
              ),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                color: Colors.black,
                size: 30,
              ),
              activeIcon: Icon(
                Icons.chat_bubble,
                color: Colors.black,
                size: 30,
              ),
              label: 'Chat Room',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.newspaper,
                color: Colors.black,
                size: 30,
              ),
              activeIcon: FaIcon(
                FontAwesomeIcons.solidNewspaper,
                color: Colors.black,
                size: 30,
              ),
              label: 'News',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.sliders,
                color: Colors.black,
                size: 30,
              ),
              activeIcon: FaIcon(
                FontAwesomeIcons.sliders,
                color: Colors.black,
                size: 30,
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
