import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:pleasure_mobile_app/app/screens/login/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class URLPageButton extends StatelessWidget {
  final String link;

  const URLPageButton({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'WWW',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.blue[400],
            shadows: const [
              Shadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -15),
          child: IconButton(
            icon: const Icon(Icons.link),
            iconSize: 70,
            color: Colors.blue[400],
            onPressed: () async {
              if (await canLaunchUrl(Uri.parse(link))) {
                await launchUrl(Uri.parse(link));
              } else {
                throw 'Could not launch $link';
              }
            },
          ),
        ),
      ],
    );
  }
}

//PREVIOUS VERSION WITH TEXT
// SizedBox(
//   width: MediaQuery.of(context).size.width * 0.7,
//   height: MediaQuery.of(context).size.height * 0.08,
//   child: FloatingActionButton(
//       backgroundColor: Colors.blue[800],
//       onPressed: () async {
//         if (await canLaunchUrl(Uri.parse(link))) {
//           await launchUrl(Uri.parse(link));
//         } else {
//           throw 'Could not launch $link';
//         }
//       },
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(9.0),
//       ),
//       elevation: 7,
//       child: const InnerShadow(
//         blur: 1,
//         color: Colors.black87,
//         offset: Offset(0, 2),
//         child: Center(
//           child: Text(
//             'ODWIEDŹ STRONĘ',
//             style: TextStyle(
//               fontSize: 27,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//               shadows: [
//                 Shadow(
//                   color: Colors.black12,
//                   blurRadius: 2,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       )),
// );
