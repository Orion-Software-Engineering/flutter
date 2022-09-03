import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/variables.dart';
import 'package:matchmaking_demo/models/events_model.dart';

class EventsDetails extends StatelessWidget {
  EventsDetails({Key? key, required this.event}) : super(key: key);
  final Event event;
  final eventDetailsModel = EventDetailsModel(
      id: Details[0].id,
      name: Details[0].name,
      date: Details[0].date,
      time: Details[0].time,
      venue: Details[0].venue,
      organizers: Details[0].organizers,
      mcs: Details[0].mcs,
      guests: Details[0].guests,
      description: Details[0].description,
      age_restriction: Details[0].age_restriction,
      organizer: Details[0].organizer,
      cover_image: Details[0].cover_image);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:  const <Widget>[
        SliverAppBar(
          expandedHeight: 420.0,
          pinned: false,
          snap: false,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network('https://i.pinimg.com/236x/39/ed/cf/39edcf969346dd916b082b8a39d4af0f.jpg'),
          ),
        ),
      ]
    );
  }
}
