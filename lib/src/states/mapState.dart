import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  static final LatLng porriHouseCoordinates = LatLng(40.680385, -3.617856);

  final CameraPosition porriHouseCamera = CameraPosition(
    target: porriHouseCoordinates,
    zoom: 18,
  );

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId(porriHouseCoordinates.latitude.toString()),
      position: porriHouseCoordinates,
      infoWindow: InfoWindow(
        title: 'Porricultores',
        snippet: 'Caseta',
      ),
      icon: BitmapDescriptor.defaultMarker,
    )
  };
}
