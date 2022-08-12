// ignore_for_file: unused_import

/*
* HomePage is a "recyclerview" with a lost of possible matches(*/

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/home/home_scaffold.dart';
import 'package:matchmaking_demo/utils/variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: PossibleMatches.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: const <Color>[Color(0xB5A6A5A5), Color(0xEDE3E3E3)],
                ),
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      PossibleMatches[index].name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 32),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      PossibleMatches[index].about,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
