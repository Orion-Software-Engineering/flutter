// ignore_for_file: unused_import, unused_local_variable, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class DummyHome extends StatefulWidget {
  const DummyHome({Key? key}) : super(key: key);

  @override
  State<DummyHome> createState() => _DummyHomeState();
}

class _DummyHomeState extends State<DummyHome> {
  Position? userPosition;
  void getCurrentPosition() async {
    Position position = await askLocationPermission();
    setState(() {
      userPosition = position;
    });
  }

  Future<Position> askLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dummy Home"),
      ),
      body: Container(
        child: userPosition != null
            ? Text(userPosition.toString())
            : Text("DENIED"),
      ),
    );
  }
}
