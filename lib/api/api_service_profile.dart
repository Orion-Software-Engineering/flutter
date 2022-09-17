import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/profile/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_call_paths.dart';

class APIServiceProfile {
  ProfileResponseModel profileResponseModel = ProfileResponseModel();

  Future<void> getProfile(String userId) async {
    print(
        "APISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\nAPISERVICEUSERID\n${userId}");
    Uri url = Uri(scheme: scheme, host: host, path: profilePath + userId);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var profileResponse = json.decode(response.body);
        print(json.decode(response.body));
        profileResponseModel.id = profileResponse["id"];
        profileResponseModel.email = profileResponse["email"];
        profileResponseModel.username = profileResponse["username"];
        profileResponseModel.dateOfBirth = profileResponse["dateOfBirth"];
        profileResponseModel.gender = profileResponse["gender"];
      } else {
        throw Exception('Failed to get profile ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
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
