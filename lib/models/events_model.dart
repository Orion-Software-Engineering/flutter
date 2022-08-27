class EventDetailsRequestModel {}

class EventDetailsResponseModel {}

class EventListRequestModel {

}

class EventListResponseModel {

    String? token;
    String? error;

    EventListResponseModel({this.token, this.error});

    factory EventListResponseModel.fromJson(List<dynamic> events) {
      return EventListResponseModel(

      );

  }

}
