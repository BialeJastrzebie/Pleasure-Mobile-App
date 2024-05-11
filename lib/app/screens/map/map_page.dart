import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/app/shared/utils/base_view.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  static const LatLng currentLocation = LatLng(51.7478755, 19.4519941);
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Scaffold(
        body: GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: currentLocation,
            zoom: 14,
          ),
          onMapCreated: (controller) {
            mapController = controller;
          },
        ),
      ),
    );
  }
}

