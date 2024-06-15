import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigateToLocationButton extends StatelessWidget {
  final LatLng location;

  const NavigateToLocationButton({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Text(
            'TRASA',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.green[400],
              shadows: const [
                Shadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        Transform.translate(
          offset: const Offset(0, -10),
          child: IconButton(
            icon: const Icon(Icons.navigation_rounded),
            iconSize: 60,
            color: Colors.green[400],
            onPressed: () async {
              final Uri url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=${location.latitude},${location.longitude}&travelmode=transit');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ),
      ],
    );
  }
}