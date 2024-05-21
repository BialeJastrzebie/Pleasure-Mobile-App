import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '/app/shared/themes/theme.dart';

class CouponButton extends StatelessWidget {
  const CouponButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.09,
      child: FloatingActionButton(
          backgroundColor: buttonColor,
          onPressed: () {
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
          elevation: 5,
          child: const InnerShadow(
            blur: 1,
            color: Colors.black12,
            offset: Offset(0, 2),
            child: Center(
              child: Text(
                'Odbierz',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}