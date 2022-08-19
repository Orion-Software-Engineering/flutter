import 'package:http/http.dart' as http;
//import 'package:matchmaking_demo/models/events_model.dart';

import '../utils/constants.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class EventsAPIService{

  var url = Uri(
    scheme: scheme,
    host: host,
    path: eventsPath,
  );
  
}