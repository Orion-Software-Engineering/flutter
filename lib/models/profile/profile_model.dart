class ProfileResponseModel {
  String? id;
  String? email;
  String? isEmailVerified;
  String? username;
  String? dateOfBirth;
  bool? gender;
  String? bio;
  List<String>? interests = [];

  ProfileResponseModel(
      {this.id,
      this.email,
      this.isEmailVerified,
      this.username,
      this.dateOfBirth,
      this.gender,
      this.bio,
      this.interests});
}

class UpdateBioRequestModel {
  String userId = '';
  String bio = '';

  Map<String, String> toJson() {
    return {"userId": userId, "bio": bio};
  }

  UpdateBioRequestModel({required this.userId, required this.bio});
}
