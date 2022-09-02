//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:matchmaking_demo/api/api_service_events.dart';
import 'package:matchmaking_demo/components/events_details/events_details.dart';
import 'package:matchmaking_demo/utils/variables.dart';
import 'package:matchmaking_demo/models/events_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
  late Future<List<Event>> _futureEvents;
  int eventCount = 4;

  @override
  Widget build(BuildContext context) {
    _futureEvents = getEvents();

    return FutureBuilder<List<Event>>(
      future: _futureEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 150.0 / 200.0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventsDetails(
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
                        color: Colors.grey,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                );
              }, //itemBuilder
            );
          }
          // TODO: make this beautiful (NK)
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
                      color: Colors.grey),
                ),
              )
            ],
          );
        }
        //Shimmer during fetching
        return GridView.builder(
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 150.0 / 190.0),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(20.0),
              width: 150.0,
              height: 190.0,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(8)),
            );
          },
        );
      },
    );
  }
}
