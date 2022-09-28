//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_events.dart';
import 'package:matchmaking_demo/components/events_details/events_details.dart';
import 'package:matchmaking_demo/utils/save_event.dart';
import 'package:matchmaking_demo/utils/variables.dart';
import 'package:matchmaking_demo/models/events_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/constants.dart';
import '../utils/get_event_data.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
  late Future<List<Event>> _futureEvents;
  late Future<List<String>> _savedEvents;
  int eventCount = 4;

  @override
  Widget build(BuildContext context) {
    _futureEvents = getEvents();
    _savedEvents = getSavedEvents();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          toolbarHeight: 0.0,
          automaticallyImplyLeading: false,
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.trending_up)),
            Tab(
              icon: Icon(Icons.bookmark_added),
            )
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            FutureBuilder<List<Event>>(
              future: _futureEvents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 150.0 / 190.0),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventsDetailsPage(
                                  event: snapshot.data![index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            margin: EdgeInsets.all(20.0),
                            width: 150.0,
                            height: 190.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(snapshot.data![index].coverImage),
                                  fit: BoxFit.fill,
                                ),
                                color: Theme.of(context).primaryTextTheme.bodyText2?.color,
                                border: Border.all(color: signUpLoginTextColor),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        );
                      }, //itemBuilder
                    );
                  }
                  // -----------------------------------------------No events to show screen------------------------------------------------------
                  return Column(
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 90,
                        margin: EdgeInsets.fromLTRB(50, 180, 50, 0.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Events/noresults.png',
                            ),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.modulate),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 20.0),
                        child: Text(
                          "Event organizers are probably cooking something fun. Check "
                          "again later!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0, color: Colors.grey),
                        ),
                      ),
                    ],
                  );
                }
                //Shimmer during fetching
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  direction: ShimmerDirection.ltr,
                  highlightColor: Colors.grey[300]!,
                  child: GridView.builder(
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 150.0 / 190.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.all(20.0),
                        width: 150.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            border: Border.all(color: Colors.grey.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(8)),
                      );
                    },
                  ),
                );
              },
            ),
            //--------------------------------------------------------SavedEventsContent-----------------------------------------------------------
            /*Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text('My Saved Events'),
                ],
              }, //itemBuilder
            );
          }
          // -----------------------------------------------No events to show screen------------------------------------------------------
          return Column(
            children: <Widget>[
              Container(
                width: 120,
                height: 90,
                margin: EdgeInsets.fromLTRB(50, 180, 50, 0.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Events/noresults.png',
                    ),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.5), BlendMode.modulate),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 20.0),
                child: Text(
                  "Event organizers are probably cooking something fun. Check "
                  "again later!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 20.0,
                      color:
                          Theme.of(context).primaryTextTheme.bodyText1?.color),
                ),
              ),
            )*/
            FutureBuilder<List<String>>(
              future: _savedEvents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 150.0 / 190.0),
                      itemBuilder: (BuildContext context, int index) {
                        return FutureBuilder(
                            future: getEventData(snapshot.data![index]),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                Event event = snapshot.data as Event;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EventsDetailsPage(
                                          event: event,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
                                    margin: EdgeInsets.all(20.0),
                                    width: 150.0,
                                    height: 190.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(event.coverImage),
                                          fit: BoxFit.fill,
                                        ),
                                        color: Theme.of(context).primaryTextTheme.bodyText2?.color,
                                        border: Border.all(color: signUpLoginTextColor),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                );
                              } else {
                                // TODO: implement proper loader
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[400]!,
                                  direction: ShimmerDirection.ltr,
                                  highlightColor: Colors.grey[300]!,
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
                                    margin: EdgeInsets.all(20.0),
                                    width: 150.0,
                                    height: 190.0,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.4),
                                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                );
                              }
                            });
                      }, //itemBuilder
                    );
                  }
                  // -----------------------------------------------No events to show screen------------------------------------------------------
                  return Column(
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 90,
                        margin: EdgeInsets.fromLTRB(50, 180, 50, 0.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Events/noresults.png',
                            ),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.modulate),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(50.0, 40.0, 50.0, 20.0),
                        child: Text(
                          "No events saved",
                          textAlign: TextAlign.center,
                          // TODO: theming here
                          style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20.0, color: Colors.orange.shade800),
                        ),
                      ),
                    ],
                  );
                }
                //Shimmer during fetching
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  direction: ShimmerDirection.ltr,
                  highlightColor: Colors.grey[300]!,
                  child: GridView.builder(
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 150.0 / 190.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.all(20.0),
                        width: 150.0,
                        height: 190.0,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            border: Border.all(color: Colors.grey.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(8)),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
