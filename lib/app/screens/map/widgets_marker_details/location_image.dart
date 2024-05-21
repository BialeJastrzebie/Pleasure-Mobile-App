import 'package:flutter/material.dart';

import '../../../shared/themes/theme.dart';


class LocationImage extends StatelessWidget {
  final String path;

  const LocationImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: buttonColorMenu,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2),
            spreadRadius: 2.0,
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Image(
        image: AssetImage(path),
      ),
    );
  }
}
