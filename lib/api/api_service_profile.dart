import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/profile/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/api_call_paths.dart';

class ProfileApiService {
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
        profileResponseModel.bio = profileResponse["bio"];

        List unfilteredInterestList = profileResponse["Interests"];
        List<String> interestList = [];
        for (var interest in unfilteredInterestList) {
          interestList.add(interest["name"]);
        }
        profileResponseModel.interests = interestList;
      } else {
        throw Exception('Failed to get profile ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateBio(String text) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");
    Uri url = Uri(scheme: scheme, host: host, path: updateBioPath);

    try {
      final response = await http.post(url,
          headers: headers,
          body: jsonEncode(UpdateBioRequestModel(userId: userId!, bio: text)));

      print("update bio status code ${response.statusCode}");
      print("update bio body ${response.body}");
    } catch (e) {
      rethrow;
    }
  }
}
