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
  final prefs = SharedPreferences.getInstance();
  late Future<List<Event>> _futureEvents;
  int eventCount = 4;

  @override
  Widget build(BuildContext context) {
    _futureEvents = getEvents('');

    return FutureBuilder<List<Event>>(
      future: _futureEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              itemCount: snapshot.data!.length - 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 150.0 / 200.0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventsDetails()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.all(20.0),
                      width: 150.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(FlyerURLs[index].urls),
                            fit: BoxFit.fill,
                          ),
                          color: Colors.grey,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                    ));
              });
        }
        return Text("Loading");
      },
    );
  }
}
