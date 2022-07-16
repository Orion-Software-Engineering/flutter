///The Events page of the Orion Meet application is a Stateless widget.
///It comprises of 5 main fields namely;
///The app bar
///The event lists in columns(invisible widget)[format: n * 2 matrix]
///There might be a 'Like-system' that will return a value to be a condition to tell which events will be displayed
///on the 'Trending' section of the events page.
///Basically the top 4 events with the most likes is displayed in the 'Trending' section.
///A section with Up-coming events.
import 'package:flutter/material.dart'
    show
    AppBar,
    BuildContext,
    Key,
    MaterialApp,
    Scaffold,
    StatelessWidget,
    Text,
    Widget;
import 'package:matchmaking_demo/main.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Events'),
          backgroundColor: signUpLoginOrange,
        ),
        body: Text(
          'Trending',
        ),
      ),
    );
  }
}
