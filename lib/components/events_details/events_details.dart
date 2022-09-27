import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:matchmaking_demo/utils/like_event.dart';
import 'package:matchmaking_demo/utils/variables.dart';
import 'package:matchmaking_demo/models/events_model.dart';
import '../../utils/save_event.dart';

class EventsDetailsPage extends StatefulWidget {
  const EventsDetailsPage({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  State<StatefulWidget> createState() => EventsDetailsPageState();
}

class EventsDetailsPageState extends State<EventsDetailsPage> {
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

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final Event event = widget.event;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 480.0,
            pinned: true,
            snap: false,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(event.coverImage, fit: BoxFit.cover),
            ),
            actions: [
              FutureBuilder(
                  builder: (BuildContext context, snapshot) {
                    bool isLiked = false;
                    switch (snapshot.data) {
                      case true:
                        isLiked = true;
                    }
                    return IconButton(
                      onPressed: () => {
                        // TODO: store event id in our saved list or remove it
                        likeEvent(event).whenComplete(() => setState(() {
                              isLiked = !isLiked;
                            })),
                      },
                      icon: Icon(Icons.favorite),
                      color: isLiked ? Colors.red : Colors.white,
                    );
                  },
                  future: isEventLiked(event)),
              FutureBuilder(
                  builder: (BuildContext context, snapshot) {
                    bool isSaved = false;
                    switch (snapshot.data) {
                      case true:
                        isSaved = true;
                    }
                    return IconButton(
                      onPressed: () => {
                        // TODO: store event id in our saved list or remove it
                        saveEvent(event),
                        setState(() {
                          isSaved = !isSaved;
                        })
                      },
                      icon: Icon(Icons.bookmark),
                      color: isSaved ? Colors.yellow : Colors.white,
                    );
                  },
                  future: isEventSaved(event)),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //-------------------------------Event Name and Category--------------------------------
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                  //color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5.0),
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        //color: Colors.black,
                        child: Text(
                          event.name,
                          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'Nunito'),
                        ),
                      ),
                      Container(
                        height: 35.0,
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                        //color: Colors.black,
                        child: ListView.builder(
                            itemCount: event.interests.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 4.0),
                                margin: EdgeInsets.only(left: 2.0, right: 2.0),
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: InterestColors[event.interests[index]],
                                ),
                                child: Text(
                                  event.interests[index],
                                  style: TextStyle(color: Colors.white, fontFamily: 'Nunito'),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                //-----------------------------------------Event Time/Venue/Ticketing/Age restriction-------------------------------------
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
                              margin:EdgeInsets.only(bottom: 2.0),
                              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.access_time_sharp,
                                color: Colors.black,
                              ),
                            ),
                            //TimeTextfield
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                              child: Text(
                                '${event.date} --- ${event.time}',
                                style: TextStyle(fontSize: 16.0, fontFamily: 'Nunito', fontWeight: FontWeight.normal),
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
                              width: 16.0,
                              height: 22.0,
                              margin: EdgeInsets.fromLTRB(14.0, 10.0, 10.0, 10.0),
                              padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                              decoration: BoxDecoration(
                                //color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage('assets/icons/location-mark.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            //VenueTextField
                            Container(
                              padding: EdgeInsets.fromLTRB(5.0, 8.0, 10.0, 8.0),
                              child: Text(
                                event.venue,
                                style: TextStyle(fontSize: 16.0, fontFamily: 'Nunito'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          //Ticket icon
                          Container(
                            width: 18.0,
                            height: 20.0,
                            margin: EdgeInsets.fromLTRB(14.0, 10.0, 5.0, 20.0),
                            //padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                            decoration: BoxDecoration(
                              //color: Colors.black,
                              image: DecorationImage(
                                image: AssetImage('assets/icons/ticket-outline.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          //VenueTextField
                          Container(
                            padding: EdgeInsets.fromLTRB(9.0, 5.0, 10.0, 20.0),
                            child: Text(
                              event.ticketPrice,
                              style: TextStyle(fontSize: 16.0, fontFamily: 'Nunito'),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //Age restriction message.
                        //color: Colors.grey[100]!.withOpacity(0.6),
                        child: Row(
                          children: <Widget>[
                            //Warning icon
                            Container(
                              width: 16,
                              height: 18,
                              margin: EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 30.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(Colors.red, BlendMode.modulate),
                                  image: AssetImage('assets/icons/warning.png'),
                                ),
                              ),
                            ),
                            //Warning TextField
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 20.0, 10.0, 40.0),
                              child: Text(
                                'This event has an 18+ age restriction.',
                                style: TextStyle(fontSize: 13.0, fontFamily: 'Nunito', color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //---------------------------Line separator------------------------------
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
                //----------------------------------Description--------------------------------
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 20.0, fontFamily: 'Nunito'),
                  ),
                ),
                //Description Content
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20),
                  child: Text(
                    event.description,
                    style: TextStyle(fontSize: 15.0, fontFamily: 'Nunito'),
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
                          style: TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: 'Nunito'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.00, 20.0, 20.0),
                        child: Text(event.organizers,
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Nunito'),),
                      ),
                    ],
                  ),
                ),
                //---------------------------------MCs----------------------------------------
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Text(
                          'MCs',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: 'Nunito'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.00, 20.0, 20.0),
                        child: Text(event.mcs,
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Nunito'),),
                      ),
                    ],
                  ),
                ),
                //----------------------------------------Guests-------------------------------------------
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Text(
                          'Guests',
                          style: TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: 'Nunito'
                              ''),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 0.00, 20.0, 20.0),
                        child: Text(event.guests,
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Nunito'),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
