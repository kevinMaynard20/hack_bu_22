import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() =>
      _MyHomePageState(); //Kind of works how suppliers do in java
} // most of this stuff on top is p basic

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  late String search;

  late Position currentPosition;

  Set<Marker> _markers = HashSet<Marker>(); //hashset 0_0 cool taylor

  @override
  Widget build(BuildContext context) {
    // reformatted most of this based off of what

    return Scaffold(
      appBar: AppBar(
        title: Text('LendaHand'),
        backgroundColor: Colors.green[700],
      ),
      body: Stack(
        // layers widgets in reverse order
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(42.089, -75.969297), // arbitrary location
                zoom: 15),
          ),
          Positioned(
              bottom: 60.0,
              right: 15.0,
              left: 15.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {},
                child: Text('Tap to ask for a Hand!'),
              )

              // child: TextField(

              //     decoration: InputDecoration(
              //         hintText: 'Enter location here...',
              //         border: InputBorder.none,

              //         contentPadding: EdgeInsets.only(left: 15, top: 15),

              //         suffixIcon: IconButton(
              //           icon: Icon(Icons.search), // adds search icon
              //           onPressed:
              //               searchAndNavigate, // calls the class that moves and
              //           iconSize: 30,
              //         )),

              //     onChanged: (val) {
              //       setState(() {
              //         search = val;
              //       });

              )
        ],
      ),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
