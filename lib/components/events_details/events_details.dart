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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(400.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                ///This image widget will be changed to a network image
                image: NetworkImage(event.coverImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    height: 30,
                    child: Text(
                      'Description',
                      style: TextStyle(fontSize: 10.0),
                    )),
                /*  Container(
                    padding:EdgeInsets.all(10.0),
                    margin:EdgeInsets.all(10.0),
                    child: Text('Organizers'),
                  )*/
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 0.00),
              margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.00),
              child: Text(
                event.description,
                style: TextStyle(
                    fontSize: 11.0,
                    fontFamily:
                        "assets/fonts/Nunito/static/Nunito-Regular.ttf"),
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  margin: EdgeInsets.all(10.0),
                  /* decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text('Organizers',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                Spacer(), //Use Spacer between row elements
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 130.0, 0.0),
                  margin: EdgeInsets.all(10.0),
                  /*decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text('MCs',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
              ],
            ),
            //Text field sections for Organizer and MCs
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 150,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  margin: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 10.0),
                  /*decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text(event.organizers,
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Container(
                  width: 30,
                  height: 10,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                  color: Colors.black.withOpacity(0.0),
                ),
                Container(
                  /*width: 160,*/
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  margin: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 10.0),
                  /* decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text(event.mcs,
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ],
            ),

            ///Date and Guests
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  margin: EdgeInsets.all(10.0),
                  /*decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text('Date',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                Spacer(), //Use Spacer between row elements
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 120.0, 0.0),
                  margin: EdgeInsets.all(10.0),
                  /*decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text('Guests',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
              ],
            ),

            ///-------------------------------Text fields for Date and Guests---------------------------------------
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  margin: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 10.0),
                  /* decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text(event.date,
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                //Spacer(), //Use Spacer between row elements
                Container(
                  width: 112,
                  height: 10,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                  color: Colors.black.withOpacity(0.0),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 45.0, 0.0),
                  margin: EdgeInsets.fromLTRB(0.0, 0.00, 10.0, 10.0),
                  /*decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text(
                    event.guests,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),

            ///-----------------------------Time and Age Restrictions section-------------------------------------------
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                  margin: EdgeInsets.all(10.0),
                  /* decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text('Time',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 80.0, 0.0),
                  margin: EdgeInsets.all(10.0),
                  /*decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text('Age restrictions',
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  margin: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 10.0),
                  /*decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text(event.time,
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Container(
                  width: 112,
                  height: 10,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  color: Colors.black.withOpacity(0.0),
                ), //Use Spacer between row elements
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 130.0, 0.0),
                  margin: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 10.0),

                  /* decoration: BoxDecoration(
                      color: Colors.black,
                    ),*/
                  child: Text(event.ageRestriction ? "18+" : "",
                      style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
