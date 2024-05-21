import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '/app/shared/themes/theme.dart';

class OpinionButton extends StatelessWidget {
  final String link;
  const OpinionButton({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
      child: FloatingActionButton(
          backgroundColor: Colors.blue[800],
          onPressed: () {

          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
          elevation: 7,
          child: const InnerShadow(
            blur: 1,
            color: Colors.black87,
            offset: Offset(0, 2),
            child: Center(
              child: Text(
                'OPINIE',
                style: TextStyle(
                  fontSize: 32,
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