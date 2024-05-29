import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

import '../../../shared/themes/theme.dart';

class LocationName extends StatelessWidget {
  final String markerId;

  const LocationName({super.key, required this.markerId});

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      blur: 0.5,
      color: Colors.black,
      offset: const Offset(1, 2),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height * 0.1,
        child: AutoSizeText(
          markerId,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: darkerWhiteTextColorLocation,
            shadows: [
              Shadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }
}