import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class URLPageButton extends StatelessWidget {
  final String link;
  const URLPageButton({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.06,
      child: FloatingActionButton(
          backgroundColor: Colors.blue[800],
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(link))) {
              await launchUrl(Uri.parse(link));
            } else {
              throw 'Could not launch $link';
            }
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
                'ODWIEDŹ STRONĘ',
                style: TextStyle(
                  fontSize: 28,
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