import 'package:flutter/material.dart';

class EventsDetails extends StatelessWidget {
  const EventsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(400.0),
        child: AppBar(),
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
                  'This is where all the description of the event is shown.'
                      ' This description is given by the organizers on the web'
                      ' This description is given by the organizers on the web'
                      ' This description is given by the organizers on the web'
                      ' This description is given by the organizers on the web',
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0,0.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        'Organizers',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                  Spacer(),//Use Spacer between row elements
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 110.0, 0.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        'MCs',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ],
              ),
              //Text field sections for Organizer and MCs
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0,0.0),
                    margin: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        '[ORGANIZER NAME GOES HERE]',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                  Spacer(),//Use Spacer between row elements
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 110.0, 0.0),
                    margin: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        'MCs',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ],
              ),
              ///Date and Guests
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0,0.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        'Date',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                  Spacer(),//Use Spacer between row elements
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 110.0, 0.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        'Guests',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ],
              ),
              //Text fields for Date and Guests
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0,0.0),
                    margin: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        '[EVENT DATE GOES HERE]',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                  Spacer(),//Use Spacer between row elements
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 110.0, 0.0),
                    margin: EdgeInsets.fromLTRB(10.0, 0.00, 10.0, 10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        'NAMES GO HERE',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ],
              ),
              ///Time and Age Restrictions section
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0,0.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        'Time',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                  Spacer(),//Use Spacer between row elements
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 110.0, 0.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(
                        'Age restrictions',
                        style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
