import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Text('Trending',
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
            ),
          ),
          Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                width: 150.0,
                height: 200.0,
                decoration: BoxDecoration(
                    color: Colors.grey,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Event', style: TextStyle(fontSize: 30.0)),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                width: 150.0,
                height: 200.0,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Event', style: TextStyle(fontSize: 30.0)),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                width: 150.0,
                height: 200.0,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Event', style: TextStyle(fontSize: 30.0)),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                width: 150.0,
                height: 200.0,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Event', style: TextStyle(fontSize: 30.0)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
