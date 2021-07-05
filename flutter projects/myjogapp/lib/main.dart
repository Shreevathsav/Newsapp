import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:map_polyline_draw/map_polyline_draw.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController controller;
  LatLng _initialCameraPosition = LatLng(13.067439, 80.237617);
  Location _location = Location();

  void _onMapCreated(GoogleMapController ctrl) {
    controller = ctrl;
    _location.onLocationChanged.listen((l) {
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition:
            CameraPosition(target: _initialCameraPosition, zoom: 10),
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        compassEnabled: true,
      ),
    );
  }
}
