// ignore_for_file: prefer_const_constructors

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  late String search;

  late Position currentPosition;

  Set<Marker> _markers = HashSet<Marker>(); //hashset 0_0 cool taylor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LendaHand \u{1f44b}',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Color.fromARGB(255, 0, 103, 71),
      ),
      body: Stack(
        // layers widgets in reverse order
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(42.089, -75.969297), // arbitrary location
                zoom: 16),
          ),
          Positioned(
              bottom: 40.0,
              right: 10.0,
              left: 10.0,
              height: 70.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green[700], // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () => {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                elevation: 16,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                          'Fill out this Form For A Helping      \t\t  Hand!\u{1f60E}\u{1f44b}\u{1f60E}',
                                          style: TextStyle(fontSize: 16.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(25),
                                    ),
                                    TextField(
                                      style: TextStyle(),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter Title...',
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            25, 10, 25, 10)),
                                    TextField(
                                      style: TextStyle(),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter Brief Description',
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            25, 10, 25, 10)),
                                    TextField(
                                      style: TextStyle(),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Date(Format xx/xx/xx)',
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            25, 10, 25, 10)),
                                    TextField(
                                      style: TextStyle(),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Time(Format xx:xx:xx)',
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Colors.green[700], // background
                                        onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {},
                                      child: Text("Submit"),
                                    )
                                  ],
                                ),
                              );
                            }),
                      },
                  child: Text("Tap Here To Ask For A Hand!\u{1f44b}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )))

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

  void onButtonPressy() {
    Column(
      children: <Widget>[
        CustomPaint(
          child: Container(
            width: 300,
            height: 600,
            color: Colors.white,
          ),
        ),
        Text('Deliver features faster'),
        Text('Craft beautiful UIs'),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: FlutterLogo(),
          ),
        ),
      ],
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
