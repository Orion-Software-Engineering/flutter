class ProfileResponseModel {
  String? id;
  String? email;
  String? isEmailVerified;
  String? username;
  String? dateOfBirth;
  bool? gender;

  ProfileResponseModel({
    this.id,
    this.email,
    this.isEmailVerified,
    this.username,
    this.dateOfBirth,
    this.gender,
  });

  // factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
  //   return ProfileResponseModel(
  //     id: json["id"] ?? "",
  //     email: json["email"] ?? "",
  //     isEmailVerified: json["isEmailVerified"] ?? "",
  //     username: json["username"] ?? "",
  //     dateOfBirth: json["dateOfBirth"] ?? "",
  //     gender: json["gender"] ?? "",
  //   );
}
