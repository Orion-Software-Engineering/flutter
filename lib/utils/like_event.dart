import 'dart:convert';
import '../models/events_model.dart';
import 'api_call_paths.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//------------------------------Liking and Unliking -----------------------------------
Map<String, String> headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

var likeUrl = Uri(
  scheme: scheme,
  host: host,
  path: likeEventPath,
);

var unlikeUrl = Uri(
  scheme: scheme,
  host: host,
  path: unlikeEventPath,
);

Future<void> likeEvent(Event event) async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? userId = sharedPreferences.getString("userId");
  // get existing string list
  List<String>? likedEvents = sharedPreferences.getStringList('liked_events');
  List<String> eventsToLike = <String>[];
  // if (userId == null) return;

  Map<String, String> requestBody = {'userId': '7c952bb9-01b0-4214-b850-b1dc0d040d9e', 'eventId': event.id};
  if (likedEvents == null || likedEvents.isEmpty) {
    // like the event
    print('liking event');
    final response = await http.post(likeUrl, headers: headers, body: jsonEncode(requestBody));
    eventsToLike.add(event.id);
    sharedPreferences.setStringList('liked_events', eventsToLike);
    if (response.statusCode == 201) {
      print('liked successfully');
    } else {
      eventsToLike.remove(event.id);
      sharedPreferences.setStringList('liked_events', eventsToLike);
      print(response.statusCode);
    }
  } else {
    eventsToLike = likedEvents;
    // unlike the event
    print('unliking event');
    final response = await http.post(unlikeUrl, headers: headers, body: jsonEncode(requestBody));
    eventsToLike.remove(event.id);
    sharedPreferences.setStringList('liked_events', eventsToLike);
    if (response.statusCode == 200) {
      print('unliked successfully');
    } else {
      eventsToLike.add(event.id);
      sharedPreferences.setStringList('liked_events', eventsToLike);
      print(response.statusCode);
    }
  }
}

Future<bool> isEventLiked(Event event) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  List<String> likedEvents = pref.getStringList('liked_events')!;
  if (likedEvents.isNotEmpty) {
    return likedEvents.contains(event.id);
  }
  return false;
}
