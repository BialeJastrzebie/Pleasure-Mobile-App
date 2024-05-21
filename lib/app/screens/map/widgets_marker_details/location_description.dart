import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';

class DescriptionText extends StatelessWidget {
  final String description;

  const DescriptionText({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.45,
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
