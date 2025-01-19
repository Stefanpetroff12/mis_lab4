import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../domain/exam.dart';

class MapScreen extends StatelessWidget {
  final Position position;
  final List<Exam> exams;
  MapScreen({required this.position, required this.exams});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exam Locations')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 14,
        ),
        markers: _buildMarkers(),
      ),
    );
  }
  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {};

    for (var exam in exams) {
      markers.add(
        Marker(
          markerId: MarkerId(exam.location),
          position: _getLatLng(exam.location),
          infoWindow: InfoWindow(title: exam.location),
        ),
      );
    }
    return markers;
  }
  LatLng _getLatLng(String location) {
    return LatLng(position.latitude, position.longitude);
  }
}

