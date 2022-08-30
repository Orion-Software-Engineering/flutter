class EventDetailsRequestModel {}

class EventDetailsResponseModel {}

class EventListRequestModel {}

class EventListResponseModel {
  String? token;
  String? error;

  EventListResponseModel({this.token, this.error});

  factory EventListResponseModel.fromJson(List<dynamic> events) {
    return EventListResponseModel();
  }
}

class Event {
  final String id;
  final String name;
  final String date;
  final String time;
  final String venue;
  final String organizers;
  final String mcs;
  final String guests;
  final bool ageRestriction;
  final String description;
  final String coverImage;

  const Event(
      {required this.id,
      required this.name,
      required this.date,
      required this.time,
      required this.venue,
      required this.organizers,
      required this.mcs,
      required this.guests,
      required this.ageRestriction,
      required this.description,
      required this.coverImage});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'],
        name: json['name'],
        date: json['date'],
        time: json['time'],
        venue: json['venue'],
        organizers: json['organizers'],
        mcs: json['mcs'],
        guests: json['guests'],
        ageRestriction: json['age_restriction'],
        description: json['description'],
        coverImage: json['cover_image']);
  }
}
