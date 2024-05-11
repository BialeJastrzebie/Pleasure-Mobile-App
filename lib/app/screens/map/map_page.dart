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
  final Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 760.0,
              child: GoogleMap(
                padding: const EdgeInsets.only(bottom: 10.0),
                initialCameraPosition: const CameraPosition(
                  target: currentLocation,
                  zoom: 14,
                ),
                onMapCreated: (controller) {
                  mapController = controller;
                  addMarker('test', currentLocation);
                },
                markers: _markers.values.toSet(),
              ),
            ),
            const Spacer(),
            Container(
              height: 50.0,
              width: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a search term',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Implement your search functionality here
                    },
                    iconSize: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addMarker(String markerId, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(markerId),
      position: location,
      infoWindow: (const InfoWindow(
        title: 'Test',
        snippet: 'Test',
      )),
    );

    setState(() {
      _markers[markerId] = marker;
    });
  }
}
