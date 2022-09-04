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
                          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                        //color: Colors.black,
                        child: Text(
                          'Colors will go here',
                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
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
                        child: Row(
                          children: <Widget>[
                            //Clock Icon
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.access_time_sharp,
                                color: Colors.black,
                              ),
                            ),
                            //TimeTextfield
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 8.0),
                              child: Text(
                                '${eventDetailsModel.date} --- ${eventDetailsModel.time}',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //Venue
                        child: Row(
                          children: <Widget>[
                            //Venue icon
                            Container(
                              width: 20.0,
                              height: 20.0,
                              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/location-mark-svgrepo-com.svg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            //VenueTextField
                            Container(
                              padding: EdgeInsets.fromLTRB(2, 0.0, 10.0, 8.0),
                              child: Text(
                                '${eventDetailsModel.venue}',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        //Venue
                        child: Row(
                          children: <Widget>[
                            //Ticket icon
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                              child: Icon(
                                Icons.airplane_ticket_outlined,
                                size: 22,
                              ),
                            ),
                            //VenueTextField
                            Container(
                              padding: EdgeInsets.fromLTRB(2, 0.0, 10.0, 25.0),
                              child: Text(
                                '[Ticket pricing goes here]',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //Venue
                        child: Row(
                          children: <Widget>[
                            //Warning icon
                            Container(),
                            //Warning TextField
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0.0, 10.0, 40.0),
                              child: Text(
                                'This event has an 18+ age restriction.',
                                style: TextStyle(fontSize: 10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //-------------------------Line separator---------------------------------
                      Container(
                        width: 310.0,
                        height: 1.0,
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                //------------------------Description------------------------------------------
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                //Description Content
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20),
                  child: Text(
                    '${eventDetailsModel.description}',
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                //-------------------------------Organizers------------------------------------
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Text(
                          'Organizers',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.00, 20.0, 20.0),
                        child: Text('${eventDetailsModel.organizers}'),
                      ),
                    ],
                  ),
                ),
                //------------------------------------MCs----------------------------------------
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Text(
                          'MCs',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.00, 20.0, 20.0),
                        child: Text('${eventDetailsModel.mcs}'),
                      ),
                    ],
                  ),
                ),
                //-------------------------------------Guests--------------------------------------
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Text(
                          'Guests',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.00, 20.0, 20.0),
                        child: Text('${eventDetailsModel.guests}'),
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
