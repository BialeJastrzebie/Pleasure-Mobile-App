import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../../shared/themes/theme.dart';
import '../../login/login_page.dart';

class MyLikeButton extends StatefulWidget {
  final String markerId;
  final Function updateFavouriteLocations;

  const MyLikeButton(
      {super.key,
      required this.markerId,
      required this.updateFavouriteLocations});

  @override
  State<MyLikeButton> createState() => _MyLikeButtonState();
}

class _MyLikeButtonState extends State<MyLikeButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'LUBIĘ TO',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.pink[400],
            shadows: const [
              Shadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        FutureBuilder<bool>(
          future: checkIfLiked(widget.markerId),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(buttonColorMenu),
                backgroundColor: secondaryColor,
                strokeCap: StrokeCap.round,
                strokeWidth: 6,
              );
            } else {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Transform.translate(
                    offset: const Offset(0, -5),
                    child: LikeButton(
                        isLiked: snapshot.data,
                        size: 65,
                        circleColor: const CircleColor(
                            start: Colors.white, end: Colors.white),
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: Colors.black,
                          dotSecondaryColor: secondaryColor,
                          dotThirdColor: buttonColorMenu,
                          dotLastColor: buttonColor,
                        ),
                        onTap: (isLiked) async {
                          int markerPk = 0;
                          var value = await fetchData(
                              'http://localhost:8000/api/map/locations/');
                          for (var element in value) {
                            if (element['name'] == widget.markerId) {
                              markerPk = element['id'];
                            }
                          }
                          value = await fetchData(
                              'http://localhost:8000/api/user/me');
                          var favouriteLocations = value['favorite_locations'];
                          if (isLiked) {
                            favouriteLocations.remove(markerPk);
                          } else {
                            favouriteLocations.add(markerPk);
                          }
                          await patchData(
                              'http://localhost:8000/api/user/me/', {
                            'favorite_locations': favouriteLocations,
                          });
                          await widget.updateFavouriteLocations();
                          return !isLiked;
                        }
                        )
                );
              }
            }
          },
        ),
      ],
    );
  }
}

Future<bool> checkIfLiked(String markerId) async {
  final value = await fetchData('http://localhost:8000/api/user/me');
  for (var element in value['favorite_locations']) {
    final locationValue =
        await fetchData('http://localhost:8000/api/map/locations/$element');
    if (locationValue['name'] == markerId) {
      return true;
    }
  }
  return false;
}
