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
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(PossibleMatches[index].name),
                  Text(PossibleMatches[index].about),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
