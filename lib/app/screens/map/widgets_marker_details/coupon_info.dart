import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '/app/shared/themes/theme.dart';

class CouponInfo extends StatelessWidget {
  const CouponInfo({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: buttonColorMenu,
        borderRadius: BorderRadius.circular(9.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InnerShadow(
        blur: 1.5,
        color: Colors.black,
        offset: const Offset(0, 3),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: buttonColorMenuText,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
