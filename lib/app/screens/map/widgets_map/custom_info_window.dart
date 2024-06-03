import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CustomInfoWindow extends StatelessWidget {
  final String markerId;
  final String category;
  final LatLng location;

  const CustomInfoWindow({super.key, required this.markerId, required this.category, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(markerId),
    );
  }
}

double calculateTopPositionForCustomInfoWindow(double latitude) {
  return latitude + 2.0;
}

double calculateLeftPositionForCustomInfoWindow(double longitude) {
  return longitude - 5.0;
}

