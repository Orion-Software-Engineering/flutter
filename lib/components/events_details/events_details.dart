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
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                child: Text(
                    'Organizers',
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
              )
            ],
          )
      ),
    );
  }
}
