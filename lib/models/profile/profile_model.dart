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
}
