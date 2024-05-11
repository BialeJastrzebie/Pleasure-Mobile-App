import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '/app/shared/themes/theme.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 180.0,
      child: FloatingActionButton(
          backgroundColor: buttonColorMenu,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 30,
          child: InnerShadow(
            blur: 1.5,
            color: Colors.black,
            offset: const Offset(0, 2),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: buttonColorMenuText,
                  shadows: [
                    Shadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
