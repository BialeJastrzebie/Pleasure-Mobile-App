import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';

class PopularInfo extends StatelessWidget {
  final String text;

  const PopularInfo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 5)),
        const InnerShadow(
          blur: 2,
          color: Colors.black,
          offset: Offset(0, 2),
          child: Image(
            image: AssetImage('images/iconsflame.png'),
            width: 64,
            height: 64,
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          text,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: darkerWhiteTextColor,
            shadows: [
              Shadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}