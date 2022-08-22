import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/profile/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_call_paths.dart';
import '../utils/constants.dart';

class APIServiceProfile {
  String? email;
  String? username;
  String? dateOfBirth;
  bool? gender;

  Future<ProfileResponseModel> getProfile() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");
    print(
        "APISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\n${userId}");
    Uri url = Uri(scheme: scheme, host: host, path: profilePath + userId!);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var profileResponse = json.decode(response.body);
        print(json.decode(response.body));
        saveProfileData(profileResponse);
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

  void saveProfileData(var response) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    print("profileResponse value = $response}");
    sharedPreferences.setString("email", response["user"]["email"]);
    // sharedPreferences.setBool("isEmailVerified", isEmailVerified!);
    sharedPreferences.setString("username", response["user"]["username"]);
    sharedPreferences.setString("dateOfBirth", response["user"]["dateOfBirth"]);
    sharedPreferences.setBool("gender", response["user"]["gender"]);
    print("in saveProfileData");
  }
}
