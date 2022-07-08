class LoginResponseModel{
    late  String token;
    late  String error;

    LoginResponseModel({required this.token,required this.error});

    factory LoginResponseModel.fromJson(Map<String,dynamic> json) {
      return LoginResponseModel(token: json["token"] ?? "", error: json["error"] ?? "");
    }

}
class LoginRequestModel{
  late String email;
  late String password;

  LoginRequestModel({
    this.email="",
    this.password="",
  });


  Map<String,dynamic> toJson(){
    Map<String,dynamic> map={
      'email':email.trim(),
      'password':password.trim(),
    };

    return map;
  }






}