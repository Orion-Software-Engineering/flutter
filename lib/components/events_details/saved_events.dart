import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedEvents extends StatefulWidget {
  const SavedEvents({Key? key}) : super(key: key);

  @override
  State<SavedEvents> createState() => _SavedEventsState();
}

class _SavedEventsState extends State<SavedEvents> {
  String? savedEventVal;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Text("My Saved Events", style: TextStyle()),
      ),
    );
  }
  
  void getSavedEvents() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    savedEventVal =  pref.getStringList('eventIds') as String?;
  }
}
