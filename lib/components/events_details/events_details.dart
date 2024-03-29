import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchmaking_demo/components/login_signup/custom_back_button.dart';
import 'package:matchmaking_demo/utils/constants.dart';
import 'package:matchmaking_demo/utils/like_event.dart';
import 'package:matchmaking_demo/utils/variables.dart';
import 'package:matchmaking_demo/models/events_model.dart';
import '../../utils/save_event.dart';
import '../../utils/location.dart';

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

    return SafeArea(
      top: false,
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: CustomBackButton(
                backColor: Theme.of(context).primaryTextTheme.bodyText1?.color,
              ),
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
                      isLiked = false;
                      switch (snapshot.data) {
                        case true:
                          isLiked = true;
                      }
                      return IconButton(
                        onPressed: () => {
                          // TODO: store event id in our saved list or remove it,
                          setState(() => isLiked = !isLiked),
                          likeEvent(event).whenComplete(() => {
                                setState(() {
                                  isLiked = !isLiked;
                                })
                              }),
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
              child: Material(
                color: Theme.of(context).primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //-----------------------Event Name and Category--------------------------
                    Container(
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                      //color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                            //color: Colors.black,
                            child: Text(
                              event.name,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1
                                      ?.color),
                            ),
                          ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            height: 35.0,
                            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                            //color: Colors.black,
                            child: ListView.builder(
                              itemCount: event.interests.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 3.0,
                                      bottom: 3.0),
                                  margin:
                                      EdgeInsets.only(left: 2.0, right: 2.0),
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color:
                                        interestColors[event.interests[index]],
                                  ),
                                  child: Center(
                                    child: Text(
                                      event.interests[index],
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                          fontFamily: 'Nunito'),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                      width: 310.0,
                      height: 1.0,
                      margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      padding: EdgeInsets.all(20.0),
                      color: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          ?.color!
                          .withOpacity(0.3),
                    ),),
                    //-----------------------Event Time and Venue---------------------------
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Theme.of(context).primaryColor,
                            //Date
                            child: Row(
                              children: <Widget>[
                                //Clock Icon
                                Container(
                                  color: Theme.of(context).primaryColor,
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.access_time_sharp,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                                //TimeTextfield
                                Container(
                                  color: Theme.of(context).primaryColor,
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                                  child: Text(
                                    '${event.date} --- ${event.time}',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 18.0,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1
                                            ?.color),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            //Venue
                            child: Row(
                              children: <Widget>[
                                //Venue icon
                                Container(
                                  width: 16.0,
                                  height: 22.0,
                                  margin:
                                      EdgeInsets.fromLTRB(0.0, 0.0, 29.0, 10.0),
                                  padding:
                                      EdgeInsets.fromLTRB(8.0, 5.0, 24.0, 10.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 28,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ),
                                //VenueTextField
                                Container(
                                  color: Theme.of(context).primaryColor,
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 12.0, 10.0, 8.0),
                                  child: Text(
                                    event.venue,
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 18.0,
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1
                                            ?.color),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //---------------------------------View Location On Map--------------------------------
                          Row(
                            children: <Widget>[
                              //Ticket icon
                              Container(
                                width: 8.0,
                                height: 20.0,
                                margin:
                                    EdgeInsets.fromLTRB(12.0, 6.0, 25.0, 20.0),
                                //padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                                child: Icon(
                                  FontAwesomeIcons.ticket,
                                  size: 20,
                                ),
                              ),
                              Container(
                                color: Theme.of(context).primaryColor,
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 20.0),
                                child: Text(
                                  event.ticketPrice,
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 18.0,
                                      color: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1
                                          ?.color),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            //Age restriction message.
                            child: Row(
                              children: event.ageRestriction
                                  ? <Widget>[
                                      //Warning icon
                                      Container(
                                        width: 16,
                                        height: 18,
                                        margin: EdgeInsets.fromLTRB(
                                            13.0, 0.0, 10.0, 30.0),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            image: DecorationImage(
                                              colorFilter: ColorFilter.mode(
                                                  Colors.red,
                                                  BlendMode.modulate),
                                              image: AssetImage(
                                                  'assets/icons/warning.png'),
                                            )),
                                      ),
                                      //Warning TextField

                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            8.0, 10.0, 10.0, 40.0),
                                        child: Text(
                                          'This event has an 18+ age restriction.',
                                          style: TextStyle(
                                              fontFamily: 'Nunito',
                                              fontSize: 15.0,
                                              color: Theme.of(context)
                                                  .primaryTextTheme
                                                  .bodyText1
                                                  ?.color),
                                        ),
                                      ),
                                    ]
                                  : <Widget>[],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            child: Center(
                              child: MaterialButton(
                                color: Colors.orange,
                                onPressed: () {
                                  launchMaps(event.location);
                                },
                                child: Text(
                                  'view location on map',
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 15.0,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          //-------------------------Line separator---------------------------------
                          Container(
                            width: 310.0,
                            height: 1.0,
                            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                            padding:
                                EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                ?.color!
                                .withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    //------------------------Description------------------------------------------
                    Container(
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.0,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                ?.color),
                      ),
                    ),
                    //Description Content
                    Container(
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20),
                      child: Text(
                        event.description,
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 18.0,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1
                                ?.color),
                      ),
                    ),
                    //-------------------------------Organizers------------------------------------
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                            child: Text(
                              'Organizers',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.0,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText2
                                      ?.color),
                            ),
                          ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 0.00, 20.0, 20.0),
                            child: Text(
                              event.organizers,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito',
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1
                                      ?.color),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //------------------------------------MCs----------------------------------------
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                            child: Text(
                              'MCs',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 0.00, 20.0, 20.0),
                            child: Text(
                              event.mcs,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito',
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1
                                      ?.color),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //-------------------------------------Guests--------------------------------------
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                            child: Text(
                              'Guests',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Container(
                            color: Theme.of(context).primaryColor,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 0.00, 20.0, 20.0),
                            child: Text(
                              event.guests,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito',
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1
                                      ?.color),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
