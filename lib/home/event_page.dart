import 'package:flutter/material.dart';
import 'package:matchmaking_demo/components/events_details/events_details.dart';

import '../utils/constants.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*ListView.builder(itemBuilder:
    itemBuilder)(*/
      //The Trending section will show the tpo 4 events with the most likes or interactions.
      body: SingleChildScrollView(
        child: Wrap(
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventsDetails()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                    width: 150.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/564x/fc/73/2a/fc732ab8c4fb8050449bef420d0e9146.jpg'),
                          fit: BoxFit.fill,
                        ),
                        color:
                            Theme.of(context).primaryTextTheme.bodyText2?.color,
                        border: Border.all(color: signUpLoginTextColor),
                        borderRadius: BorderRadius.circular(8)),
                    //child: Image.network('https://i.pinimg.com/564x/fc/73/2a/fc732ab8c4fb8050449bef420d0e9146.jpg'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventsDetails()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                    width: 150.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://i.pinimg.com/564x/15/eb/25/15eb25cc07a34c365eeddd995a31f15a.jpg')),
                        color:
                            Theme.of(context).primaryTextTheme.bodyText2?.color,
                        border: Border.all(color: signUpLoginTextColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('Event', style: TextStyle(fontSize: 30.0)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventsDetails()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                    width: 150.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/564x/36/ed/03/36ed036209c304f4493b44e52e20be9b.jpg'),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(color: signUpLoginTextColor),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventsDetails()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                    width: 150.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/564x/27/96/2e/27962e3b800edc226846111df14a7fc8.jpg'),
                          fit: BoxFit.fill,
                        ),
                        color:
                            Theme.of(context).primaryTextTheme.bodyText2?.color,
                        border: Border.all(color: signUpLoginTextColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text('Event', style: TextStyle(fontSize: 30.0)),
                  ),
                ),
              ],
            ),

            //The new section based on filter settings show the events within a given time frame.
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20.0),
              //margin: EdgeInsets.all(20.0),
              child: Text(
                'Happening this week',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            )),
            Wrap(children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  width: 150.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/10/83/5c/10835c609966bef3aa5c1e26ae9b1df2.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color:
                          Theme.of(context).primaryTextTheme.bodyText2?.color,
                      border: Border.all(color: signUpLoginTextColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('Event', style: TextStyle(fontSize: 30.0)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  width: 150.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/a7/e4/b6/a7e4b6d1c1a4afbdfd123bb5167082fc.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color:
                          Theme.of(context).primaryTextTheme.bodyText2?.color,
                      border: Border.all(color: signUpLoginTextColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('Event', style: TextStyle(fontSize: 30.0)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  width: 150.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/a3/a1/88/a3a188bd35939cc7436103c86b9cf291.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color:
                          Theme.of(context).primaryTextTheme.bodyText2?.color,
                      border: Border.all(color: signUpLoginTextColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('Event', style: TextStyle(fontSize: 30.0)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  width: 150.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/19/65/1d/19651dc492b705f7965831d1f221bf94.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color:
                          Theme.of(context).primaryTextTheme.bodyText2?.color,
                      border: Border.all(color: signUpLoginTextColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('Event', style: TextStyle(fontSize: 30.0)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  width: 150.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/db/e6/9a/dbe69a692eca0f5f51589fac736336a1.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color:
                          Theme.of(context).primaryTextTheme.bodyText2?.color,
                      border: Border.all(color: signUpLoginTextColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('Event', style: TextStyle(fontSize: 30.0)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsDetails()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  width: 150.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/6a/fe/85/6afe8521df12353127db9e18c5937e15.jpg'),
                        fit: BoxFit.fill,
                      ),
                      color:
                          Theme.of(context).primaryTextTheme.bodyText2?.color,
                      border: Border.all(color: signUpLoginTextColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text('Event', style: TextStyle(fontSize: 30.0)),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
