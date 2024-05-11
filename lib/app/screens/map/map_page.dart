import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets/search_drag.dart';
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
        body: Stack(
          children:<Widget>[
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
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
              ],
            ),
            const DragFilter(),
          ],
        )
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
