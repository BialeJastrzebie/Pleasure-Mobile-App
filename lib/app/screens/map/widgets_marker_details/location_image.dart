import 'package:flutter/material.dart';

import '../../../shared/themes/theme.dart';


class LocationImage extends StatelessWidget {
  final String path;

  const LocationImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width * 0.34,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: secondaryColor,
            offset: Offset(0, 2),
            spreadRadius: 2.0,
            blurRadius: 2.0,
          ),
        ],
      ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image(
            image: NetworkImage(path),
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}
