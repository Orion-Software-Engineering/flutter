class EventDetailsRequestModel {}

class EventDetailsResponseModel {}

class EventListRequestModel {

}

class EventListResponseModel {
  String? token;
  String? error;

  EventListResponseModel({this.token, this.error});

  factory EventListResponseModel.fromJson(List<dynamic> jsonIn) {
    Map<String, dynamic> json = jsonIn[0];
    return EventListResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}
