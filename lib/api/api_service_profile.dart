import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matchmaking_demo/models/profile/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile/interest_model.dart';
import '../utils/api_call_paths.dart';

class ProfileApiService {
  ProfileResponseModel profileResponseModel = ProfileResponseModel();

  Future<void> getProfile(String userId) async {
    Uri url = Uri(scheme: scheme, host: host, path: profilePath + userId);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String accessToken = sharedPreferences.getString("accessToken")!;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-access-token': accessToken
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var profileResponse = json.decode(response.body);
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

    String accessToken = sharedPreferences.getString("accessToken")!;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-access-token': accessToken
    };
    try {
      http.post(url,
          headers: headers,
          body: jsonEncode(UpdateBioRequestModel(userId: userId!, bio: text)));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addInterests(List<String> interestsToAdd) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    Uri url = Uri(scheme: scheme, host: host, path: addInterestsPath + userId!);

    String accessToken = sharedPreferences.getString("accessToken")!;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-access-token': accessToken
    };

    http.put(url,
        headers: headers,
        body: jsonEncode(InterestCallModel(interests: interestsToAdd)));
  }

  Future<void> deleteInterests(List<String> interestsToDelete) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userId = sharedPreferences.getString("userId");

    Uri url =
        Uri(scheme: scheme, host: host, path: removeInterestsPath + userId!);

    String accessToken = sharedPreferences.getString("accessToken")!;

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-access-token': accessToken
    };

    http.delete(url,
        headers: headers,
        body: jsonEncode(InterestCallModel(interests: interestsToDelete)));
  }
}
