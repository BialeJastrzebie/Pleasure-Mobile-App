import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/utils/base_view.dart';

class MarkerDetailsPage extends StatelessWidget {
  final String markerId;

  const MarkerDetailsPage({super.key, required this.markerId});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        body: Column(
      children: [
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 10)),
            Image(
                image: AssetImage('images/kebab.png'),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3
            ),
            const Padding(padding: EdgeInsets.only(left: 30)),
            const Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 15)),
                Text(
                  'Zahir Kebab',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15)),

              ],
            ),
          ],
        ),
        const Center(
          widthFactor: 3.0,
          heightFactor: 1.0,
          child: Text(
            'Bardzo fajna restauracja w bardzo fajnym miejscu XD',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        )
      ],
    ));
  }
}
