// ignore_for_file: prefer_if_null_operators

class LoginResponseModel{
    String ?token;
    String ?error;

    LoginResponseModel({this.token,this.error});

    factory LoginResponseModel.fromJson(Map<String,dynamic> json) {
      return LoginResponseModel(token: json["token"]!=null? json["token"]: "", error: json["error"]!= null? json["error"]: "",);
    }

}
class LoginRequestModel{
  String email='';
  String password='';


  Map<String,dynamic> toJson(){
    Map<String,dynamic> map={
      'email':email?.trim(),
      'password':password?.trim(),
    };

    return map;
  }






}