import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/events_model.dart';
import 'package:matchmaking_demo/utils/api_call_paths.dart';

Future<List<Event>> getEvents(String userId) async {
  final response = await http.get(Uri.parse(eventsPath + userId));
  List<Event> events = <Event>[];

  if (response.statusCode == 200) {
    // generate a list of Events
    for (var element in (response.body as List<dynamic>)) {
      events.add(Event.fromJson(element));
    }
    print(events);

    // return the list of events
    return events;
  }

  throw Exception("Failed to retrieve events.");
}
