// ignore_for_file: prefer_if_null_operators

class LocationResponseModel {
  String? token;
  String? error;

  LocationResponseModel({this.token, this.error});

  factory LocationResponseModel.fromJson(String response) {
    return LocationResponseModel(
      token: response != null ? response : "",
      error: response != null ? response : "",
    );
  }
}

class LocationPostModel {
  String userID = '';
  String latitude = '';
  String longitude = '';

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userID.trim(),
      'latitude': latitude.trim(),
      'longitude': longitude.trim(),
    };

    return map;
  }
}
