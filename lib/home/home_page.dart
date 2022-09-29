/*
* HomePage is a "recyclerview" with a lost of possible matches(*/

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_matching.dart';
import 'package:matchmaking_demo/components/home/shimmer_dart.dart';
import 'package:matchmaking_demo/utils/app_routes.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/messaging/conversation_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MatchingApiService matchingApiService = MatchingApiService();

  List matches = [];
  String? userId;
  bool isLocationAllowed = false;

  @override
  void initState() {
    super.initState();
    getUserData().then((value) => getMatches(matchingApiService));
  }

  void getMatches(MatchingApiService matchingApiService) {
    if (!isLocationAllowed) {
      print("in the if");
      matchingApiService.getInterestBasedMatches().then((value) {
        setState(() {
          matches = matchingApiService.matchList;
        });
      });
    } else {
      print("in the else");
      matchingApiService.getLocationBasedMatches().then((value) {
        setState(() {
          matches = matchingApiService.matchList;
          print(matches);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return matches.isEmpty
        ? ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return buildShimmer();
            })
        : ListView.builder(
            itemCount: matches.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).goToChatPage(
                      ConversationInfo.withoutConversationId(
                          matches[index].userId,
                          matches[index].userName,
                          userId));
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
                          Opacity(
                            opacity: 0.3,
                            child: Image.asset(
                              'assets/images/matching/doodle1.png',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        matches[index].userName!,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 32,
                                            fontFamily: 'Nunito'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Proximity(
                                          level: matches[index].proximity),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    matches[index].bio ??
                                        "bio NA", //120 characters
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        fontFamily: 'Nunito'),
                                  ),
                                ),
                              ],
                            ),
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

  Future getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userId = sharedPreferences.getString("userId");
    setState(() {
      print("in tht setState");
      isLocationAllowed = sharedPreferences.getBool("allowLocation") ?? false;
    });
  }

  Widget buildShimmer() => ListTile(
        title: ShimmerWidget.rectangle(
          height: 160,
          width: 380,
          homeNotChat: true,
        ),
      );
}

class Proximity extends StatelessWidget {
  final int level;

  const Proximity({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    String howClose;
    switch (level) {
      case 0:
        howClose = "Very close";
        break;
      case 1:
        howClose = "Close";
        break;
      case 2:
        howClose = "Quite close";
        break;
      case 3:
        howClose = "Far";
        break;
      default:
        howClose = "";
        break;
    }

    return (howClose == "")
        ? Container()
        : Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 15,
              ),
              Text(
                howClose,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ],
          );
  }
}
