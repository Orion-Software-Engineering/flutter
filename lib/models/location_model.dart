// ignore_for_file: prefer_if_null_operators

class LocationResponseModel {
  String? token;
  String? error;

  LocationResponseModel({this.token, this.error});

  factory LocationResponseModel.fromJson(Map<String, dynamic> json) {
    return LocationResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class LocationPostModel {
  dynamic latitude;
  dynamic longitude;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'latitude': latitude,
      'longitude': longitude,
    };

    return map;
  }
}
