import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/location_model.dart';
import '../utils/api_call_paths.dart';

class LocationAPIService {
  Future<LocationResponseModel> location(LocationPostModel requestModel) async {
    var url = Uri(
      scheme: scheme,
      host: host,
      path: locationPath,
    );

    try {
      final response = await http.post(url, body: requestModel.toJson());
      print(requestModel.toJson());
      print("Location response:${response.statusCode}");
      if (response.statusCode == 200) {
        return LocationResponseModel.fromJson(response.body);
      } else {
        throw Exception("Failed to load data ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
