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
  final List<dynamic> interests;
  final String coverImage;
  final bool liked;
  final String ticketPrice;
  final String location;

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
      required this.interests,
      required this.coverImage,
      required this.liked,
      required this.ticketPrice,
      required this.location});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        id: json['id'] ?? "Unavailable",
        name: json['name'] ?? "Unavailable",
        date: json['date'] ?? "Unavailable",
        time: json['time'] ?? "Unavailable",
        venue: json['venue'] ?? "Unavailable",
        organizers: json['organizers'] ?? "Unavailable",
        mcs: json['mcs'] ?? "Unavailable",
        guests: json['guests'] ?? "Unavailable",
        ageRestriction: json['age_restriction'] ?? "Unavailable",
        description: json['description'] ?? "Unavailable",
        interests: json['interests'] ?? "Unavailable",
        coverImage: json['cover_image'] ?? "Unavailable",
        liked: json['liked'] ?? false,
        ticketPrice: json['ticket_price'] ?? "Unavailable",
        location: json['location'] ?? "40.727337 -73.994301");
  }
}
