import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/location_model.dart';
import 'dart:convert';
import '../utils/constants.dart';
import 'package:matchmaking_demo/utils/constants.dart';

class LocationAPIService {
  Future<LocationResponseModel> location(LocationPostModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: locationPath,
    );

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      print(jsonEncode(requestModel));
      final response = await http.post(url,
          body: jsonEncode(requestModel), headers: headers);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return LocationResponseModel.fromJson(json.decode(response.body));
      } else {
        // print(response.body);
        throw Exception("Failed to load data ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
