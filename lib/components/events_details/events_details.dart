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
      interests: Details[0].interests,
      cover_image: Details[0].cover_image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 480.0,
            pinned: false,
            snap: false,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  'https://i.pinimg'
                  '.com/564x/42/91/ec/4291ecdf87037abc45712311f89e236d.jpg',
                  fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //-----------------------Event Name and Category--------------------------
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                  //color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        //color: Colors.black,
                        child: Text(
                          eventDetailsModel.name,
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                        //color: Colors.black,
                        child: Text(
                          ' #${eventDetailsModel.interests}',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                //-----------------------Event Time and Venue---------------------------
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        //Date
                        child:  Row(
                          children: <Widget>[
                            //Clock Icon
                            Container(),
                            //Textfield
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                              child: Text('${eventDetailsModel.date} --- ${eventDetailsModel.time}',
                              style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
