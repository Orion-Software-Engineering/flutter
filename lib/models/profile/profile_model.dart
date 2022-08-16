import 'package:shared_preferences/shared_preferences.dart';

class ProfileResponseModel {
  String? id;
  String? email;
  bool? isEmailVerified;
  String? username;
  String? dateOfBirth;
  String? gender;

  ProfileResponseModel({
    this.id,
    this.email,
    this.isEmailVerified,
    this.username,
    this.dateOfBirth,
    this.gender,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      id: json["id"] ?? "",
      email: json["email"] ?? "",
      isEmailVerified: json["isEmailVerified"] ?? "",
      username: json["username"] ?? "",
      dateOfBirth: json["dateOfBirth"] ?? "",
      gender: json["gender"] ?? "",
    );
  }
}

// class ProfileRequestModel {
//   String? userId;
//   // Future getUserId() async {
//   //   final SharedPreferences sharedPreferences =
//   //       await SharedPreferences.getInstance();
//   //   print("from getUserId userId = ${sharedPreferences.getString("userId")}");
//   //   userId = sharedPreferences.getString("userId");
//   // }
//
//   Map<String, dynamic> toJson() {
//     getUserId();
//     print(userId);
//     Map<String, dynamic> map = {'userId': userId};
//
//     return map;
//   }
// }
