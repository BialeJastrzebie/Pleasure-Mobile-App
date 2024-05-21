import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_map/drag_filter.dart';
import '../../shared/utils/change_screen_animation.dart';
import '/app/shared/utils/base_view.dart';
import 'marker_details_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  static const LatLng currentLocation = LatLng(51.7478755, 19.4519941);
  Completer<GoogleMapController> mapController = Completer();

  Set<String> activeFilters = {};

  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }

  final Map<String, Marker> _markers = {};

    @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Scaffold(
          body: Stack(
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GoogleMap(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  initialCameraPosition: const CameraPosition(
                    target: currentLocation,
                    zoom: 15,
                  ),
                  onMapCreated: (controller) async {
                    mapController.complete(controller);
                    addMarker(
                      'Zahir Kebab',
                      currentLocation,
                      'Jedzenie',
                        await getBitmapDescriptorFromAssetBytes("images/kebab.png", 100),
                    );
                  },
                  markers: _markers.values.toSet(),
                  myLocationEnabled: true,
                ),
              ),
            ],
          ),
          DragFilter(activeFilters: activeFilters),
        ],
      )),
    );
  }

  void addMarker(String markerId, LatLng location, String category, BitmapDescriptor customIcon) {
    var marker = Marker(
      markerId: MarkerId(markerId),
      position: location,
      icon: customIcon,
      infoWindow: InfoWindow(
        title: markerId,
        snippet: category,
      ),
      onTap: () {
        animateScreenChange(context, MarkerDetailsPage(markerId: markerId),
            Curves.fastLinearToSlowEaseIn);
      },
    );

    setState(() {
      _markers[markerId] = marker;
    });
  }
}
