/*
* HomePage is a "recyclerview" with a lost of possible matches(*/

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_matching.dart';
import 'package:matchmaking_demo/api/messaging/api_service_conversation.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List matches = [];
  @override
  void initState() {
    super.initState();
    MatchingApiService matchingApiService = MatchingApiService();
    matchingApiService.getMatches().then((value) {
      setState(() {
        matches = matchingApiService.matches;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            APIServiceConversation apiServiceConversation =
                APIServiceConversation();
            apiServiceConversation
                .createConversation(
                    matches[index].userId, matches[index].userName)
                .then((value) => Navigator.of(context).goToChatPage(
                    apiServiceConversation.conversationInfoFromMatchScreen));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                height: 160,
                width: 380,
                decoration: BoxDecoration(
                  color: matchingCardColors[index % 5],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/matching/doodle.png',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            matches[index].userName,
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
                            '...', //120 characters
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
