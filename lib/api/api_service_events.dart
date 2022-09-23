import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/events_model.dart';
import 'package:matchmaking_demo/utils/api_call_paths.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Event>> getEvents() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String userId = sharedPreferences.getString("userId") != null ? sharedPreferences.getString("userId")! : "";
  var url = Uri(
    scheme: scheme,
    host: host,
    path: eventsPath + userId,
  );
  final response = await http.get(url);
  List<Event> events = <Event>[];

  if (response.statusCode == 200) {
    print(response.body);
    // generate a list of Events
    for (var element in (jsonDecode(response.body) as List<dynamic>)) {
      print(element);
      events.add(Event.fromJson(element));
    }

    // return the list of events
    return events;
  }

  throw Exception("Failed to retrieve events.");
}
