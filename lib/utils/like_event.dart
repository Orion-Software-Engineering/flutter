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
  if (userId == null) return;

  Map<String, String> requestBody = {'userId': userId, 'eventId': event.id};
  if (event.liked) {
    // unlike the event
    await http.post(unlikeUrl, headers: headers, body: jsonEncode(requestBody));
  } else {
    // like the event
    await http.post(likeUrl, headers: headers, body: jsonEncode(requestBody));
  }
}
