import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';

class HeadingText extends StatelessWidget {
  final String text;

  const HeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10),
      child: InnerShadow(
        blur: 0.5,
        color: Colors.black87,
        offset: const Offset(0, 2),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: secondaryColor,
            shadows: [
              Shadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
