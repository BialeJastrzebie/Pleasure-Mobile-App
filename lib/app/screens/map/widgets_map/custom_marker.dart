import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

class CustomMarker extends StatelessWidget {
  final String markerId;
  final String category;
  const CustomMarker({super.key, required this.markerId, required this.category});

  @override
  Widget build(BuildContext context) {
      return FittedBox(
        child: Column(
          children: <Widget>[
            InnerShadow(
              blur: 6,
              color: Colors.black,
              offset: const Offset(0, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: getColor(category),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                width: 200, // match the width of the image
                child: AutoSizeText(
                  markerId,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Image(image: getImage(category),
              width: 120,
              height: 120
            ),
          ],
        ),
      );
    }


  ImageProvider<Object> getImage(String category) {
    if (category == 'sklep') {
      return const AssetImage('images/shop.png');
    } else if (category == 'klub') {
      return const AssetImage('images/club.png');
    } else if (category == 'teatr') {
      return const AssetImage('images/theater.png');
    } else if (category == 'pub') {
      return const AssetImage('images/pub.png');
    } else if (category == 'jedzenie'){
      return const AssetImage('images/menu.png');
    }
    else {
      return const AssetImage('images/www.png');
    }
  }

  getColor(String category) {
    if (category == 'sklep') {
      return Colors.green[300];
    } else if (category == 'klub') {
      return Colors.pink[300];
    } else if (category == 'teatr') {
      return Colors.red[300];
    } else if (category == 'pub') {
      return Colors.purple[300];
    } else if (category == 'jedzenie'){
      return Colors.orange[400];
    } else {
      return Colors.black;
    }
  }

}

