import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pleasure_mobile_app/app/screens/login/login_page.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_map/sliding_panel.dart';
import 'package:provider/provider.dart';
import '../../shared/utils/change_screen_animation.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';
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
  get activeFilterSize => Provider.of<FilterState>(context).filterSize;
  get activeFilters => Provider.of<FilterState>(context).activeFilters;

  Set<String> favouriteLocations = {};

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
      if (activeFilters.contains('ulubione') && activeFilterSize > 1) {
        return _allMarkers.values.where((marker) {
          return favouriteLocations.contains(marker.markerId.value) ||
              activeFilters.contains(marker.infoWindow.snippet);
        }).toSet();
      } else if (activeFilters.contains('ulubione')) {
        return _allMarkers.values.where((marker) {
          return favouriteLocations.contains(marker.markerId.value);
        }).toSet();
      } else {
        return _allMarkers.values.where((marker) {
          return activeFilters.contains(marker.infoWindow.snippet);
        }).toSet();
      }
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
                      fetchData('http://localhost:8000/api/map/locations/')
                          .then((value) {
                        value.forEach((element) {
                          addMarker(element);
                        });
                      });
                      favouriteLocations = await fetchFavouriteLocations();
                    },
                    markers: getMarkers(),
                    // Use the data from the Future
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

  Future<void> addMarker(Map<String, dynamic> element) async {
    String markerID = element['name'];
    LatLng location = LatLng(
        double.parse(element['latitude']), double.parse(element['longitude']));
    String category = element['category'];
    String pathToImage = element['image'];
    BitmapDescriptor markerIcon = await chooseIcon(category);
    var marker = Marker(
      markerId: MarkerId(markerID),
      position: location,
      icon: markerIcon,
      infoWindow: InfoWindow(
        title: markerID,
        snippet: category,
      ),
      onTap: () {
        animateScreenChange(
            context,
            MarkerDetailsPage(
              markerId: markerID,
              image: pathToImage,
              description: element['description'],
              address: element['address'],
              couponInfo: element['coupon'],
              urlPageButton: element['url'],
            ),
            Curves.fastLinearToSlowEaseIn);
      },
    );

    setState(() {
      _allMarkers[markerID] = marker;
    });
  }

  Future<BitmapDescriptor> chooseIcon(String category) async {
    BitmapDescriptor customIcon;

    if (category == 'jedzenie') {
      customIcon =
          await getBitmapDescriptorFromAssetBytes('images/menu.png', 100);
    } else if (category == 'sklep') {
      customIcon =
          await getBitmapDescriptorFromAssetBytes('images/shop.png', 100);
    } else if (category == 'klub') {
      customIcon =
          await getBitmapDescriptorFromAssetBytes('images/club.png', 100);
    } else if (category == 'teatr') {
      customIcon =
          await getBitmapDescriptorFromAssetBytes('images/theater.png', 100);
    } else if (category == 'pub') {
      customIcon =
          await getBitmapDescriptorFromAssetBytes('images/pub.png', 100);
    } else {
      customIcon = BitmapDescriptor.defaultMarker;
    }

    return customIcon;
  }
}

Future<Set<String>> fetchFavouriteLocations() async {
  var value = await fetchData('http://localhost:8000/api/user/me');
  List<dynamic> locations = value['favorite_locations'];
  Set<String> locationsNames = {};
  await Future.wait(locations.map((element) async {
    String locationName = await fetchLocationName(element);
    locationsNames.add(locationName);
  }));
  return locationsNames;
}

Future<String> fetchLocationName(int id) async {
  var value = await fetchData('http://localhost:8000/api/map/locations/$id');
  return value['name'];
}
