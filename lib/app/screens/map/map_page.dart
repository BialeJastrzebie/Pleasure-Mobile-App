import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pleasure_mobile_app/app/screens/login/login_page.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_map/custom_marker.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_map/sliding_panel.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
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
  static const LatLng tulCoordinates = LatLng(51.749923, 19.452604);

  Completer<GoogleMapController> mapController = Completer();

  Future<GoogleMapController> get mapControllerFuture => mapController.future;

  get activeFilters => Provider.of<FilterState>(context).activeFilters;

  Set<String> _favouriteLocations = {};

  Set<String> get favouriteLocations => _favouriteLocations;

  Set<Marker> getMarkers() {
    if (activeFilters.isEmpty) {
      return _allMarkers.values.toSet();
    } else {
      if (activeFilters.contains('ulubione') && activeFilters.length > 1) {
        return _allMarkers.values.where((marker) {
          return _favouriteLocations.contains(marker.markerId.value) ||
              activeFilters.contains(_markerCategories[marker.markerId.value]);
        }).toSet();
      } else if (activeFilters.contains('ulubione')) {
        return _allMarkers.values.where((marker) {
          return _favouriteLocations.contains(marker.markerId.value);
        }).toSet();
      } else {
        return _allMarkers.values.where((marker) {
          return activeFilters
              .contains(_markerCategories[marker.markerId.value]);
        }).toSet();
      }
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

  bool isLoading = true;

  Future<void> fetchAllData() async {
    var results = await Future.wait([
      fetchFavouriteLocations(),
    ]);
    _favouriteLocations = results[0];

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.wait([
      fetchAllData(),
    ]);
  }

  final Map<String, Marker> _allMarkers = {};
  final Map<String, String> _markerCategories = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BaseView(
          body: Scaffold(
            body: Stack(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Stack(
                        children: [
                          GoogleMap(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            initialCameraPosition: const CameraPosition(
                              target: tulCoordinates,
                              zoom: 15,
                            ),
                            onMapCreated: (controller) async {
                              mapController.complete(controller);
                              var value = await fetchData(
                                  'http://localhost:8000/api/map/locations/');
                              for (var element in value) {
                                await addMarker(element);
                              }
                            },
                            markers: getMarkers(),
                            // Use the data from the Future
                            myLocationEnabled: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // DragFilter(activeFilters: activeFilters),
                SlidingPanel(
                    mapControllerFuture: mapControllerFuture,
                    updateFavouriteLocations: updateFavouriteLocations),
              ],
            ),
          ),
        ),
        if (isLoading)
          const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(buttonColorMenu),
                backgroundColor: secondaryColor,
                strokeCap: StrokeCap.round,
                strokeWidth: 6,
              ),
            ),
          ),
      ],
    );
  }

  Future<void> addMarker(Map<String, dynamic> element) async {
    String markerID = element['name'];
    LatLng location = LatLng(
        double.parse(element['latitude']), double.parse(element['longitude']));
    String category = element['category'];
    String pathToImage = element['image'];
    // BitmapDescriptor markerIcon = await chooseIcon(category);
    var marker = Marker(
      markerId: MarkerId(markerID),
      position: location,
      icon: await CustomMarker(
        markerId: markerID,
        category: category,
      ).toBitmapDescriptor(
        logicalSize: const Size(300, 300),
        imageSize: const Size(300, 300),
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
              navLocation: location,
              updateFavouriteLocations: updateFavouriteLocations,
            ),
            Curves.fastLinearToSlowEaseIn);
      },
    );

    setState(() {
      _allMarkers[markerID] = marker;
      _markerCategories[markerID] = category;
    });
  }

  updateFavouriteLocations() async {
    _favouriteLocations = await fetchFavouriteLocations();
    setState(() {});
  }
}
