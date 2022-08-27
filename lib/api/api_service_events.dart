import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/events_model.dart';
import 'package:matchmaking_demo/api/api_service_signup.dart';
import 'dart:convert';

import '../utils/api_call_paths.dart';

class EventAPIService {
  Future<EventListResponseModel> event() async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: eventsPath,
    );

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final response = await http.get(url);
      print(response.body);
      print(response.statusCode);
      print(response.body.runtimeType);

      if(response.statusCode == 200){
        return EventListResponseModel.fromJson(json.decode(response.body));
      }
      else{
        throw Exception("Benas");
      }
    } catch (e) {
      rethrow;
    }
  }
}
