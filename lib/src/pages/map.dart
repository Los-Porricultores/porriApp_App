import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:porri_app/src/controllers/mapController.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/states/mapState.dart';

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        initialCameraPosition: sl<MapState>().porriHouseCamera,
        onMapCreated: (GoogleMapController controller) {
          sl<MapController>().googleMapController = controller;
        },
        markers: sl<MapState>().markers,
      ),
    );
  }
}
