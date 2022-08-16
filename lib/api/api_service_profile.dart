import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/profile/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

class APIServiceProfile {
  Future<ProfileResponseModel> getProfile() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");
    print(
        "APISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\n${userId}");
    Uri url = Uri(
        scheme: scheme,
        host: host,
        path: profilePath,
        queryParameters: {"userId": userId});
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return ProfileResponseModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to get profile ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
      //   final request = http.Request("GET", url);
      //   final response = request.send().stream.first;
    }
  }
}
