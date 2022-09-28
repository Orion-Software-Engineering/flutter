import 'dart:convert';

import '../models/events_model.dart';
import 'api_call_paths.dart';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

Future<Event?> getEventData(String eventId) async {
  var getEventUrl = Uri(
    scheme: scheme,
    host: host,
    path: getEvent + eventId,
  );

  final response = await http.get(getEventUrl, headers: headers);
  if (response.statusCode == 200) {
    return Event.fromJson(jsonDecode(response.body));
  }

  return null;
}
