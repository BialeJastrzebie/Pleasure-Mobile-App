import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_map/sliding_panel.dart';
import 'package:provider/provider.dart';
import '../../shared/utils/change_screen_animation.dart';
import '/app/shared/utils/base_view.dart';
import 'filter_state.dart';
import 'marker_details_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  static const LatLng tmpLocation = LatLng(51.7478755, 19.4519941);
  Completer<GoogleMapController> mapController = Completer();

  Future<GoogleMapController> get mapControllerFuture => mapController.future;

  get activeFilters => Provider.of<FilterState>(context).activeFilters;

  /////////////////////////////////////////////////////////////////////////////
  //Element for icon handling
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<BitmapDescriptor> getBitmapDescriptorFromAssetBytes(
      String path, int width) async {
    final Uint8List imageData = await getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(imageData);
  }

  ///////////////////////////////////////////////////////////////////////////

  Set<Marker> getMarkers() {
    if (activeFilters.isEmpty) {
      return _allMarkers.values.toSet();
    } else {
      return _allMarkers.values.where((marker) {
        return activeFilters.contains(marker.infoWindow.snippet);
      }).toSet();
    }
  }

  final Map<String, Marker> _allMarkers = {};

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
                      target: tmpLocation,
                      zoom: 15,
                    ),
                    onMapCreated: (controller) async {
                      mapController.complete(controller);
                      addMarker(
                        'Zahir Kebab',
                        tmpLocation,
                        'restaurants',
                        await getBitmapDescriptorFromAssetBytes(
                            "images/kebab.png", 100),
                      );
                    },
                    markers: getMarkers(),
                    myLocationEnabled: true,
                  ),
                ),
              ],
            ),
            // DragFilter(activeFilters: activeFilters),
            SlidingPanel(mapControllerFuture: mapControllerFuture),
          ],
        ),
      ),
    );
  }

  void addMarker(String markerId, LatLng location, String category,
      BitmapDescriptor customIcon) {
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
      _allMarkers[markerId] = marker;
    });
  }
}
