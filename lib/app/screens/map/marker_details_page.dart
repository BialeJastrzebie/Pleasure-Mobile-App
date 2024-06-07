import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pleasure_mobile_app/app/screens/login/login_page.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/address_text.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/coupon_button.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/coupon_info.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_description.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_image.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_name.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/url_page_button.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';
import '../../shared/themes/theme.dart';

class MarkerDetailsPage extends StatelessWidget {
  final String markerId;
  final String image;
  final String description;
  final String address;
  final String couponInfo;
  final String urlPageButton;
  final Function updateFavouriteLocations;

  const MarkerDetailsPage({
      super.key,
      required this.markerId,
      required this.image,
      required this.description,
      required this.address,
      required this.couponInfo,
      required this.urlPageButton,
      required this.updateFavouriteLocations,

  });

  @override
  Widget build(BuildContext context) {
    return BaseView(
        body: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 15)),
              LocationImage(path: image),
              const Spacer(),
              Column(
                children: [
                  LocationName(markerId: markerId),
                  const Padding(padding: EdgeInsets.only(bottom: 3)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                  ),
                  AddressText(address: address),
                ],
              ),
              const Padding(padding: EdgeInsets.only(right: 10)),
            ],
          ),
        ),
        DescriptionText(description: description),
        const Padding(padding: EdgeInsets.only(top: 20)),
        couponInfo != 'null'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CouponInfo(text: couponInfo),
                  const Padding(padding: EdgeInsets.only(left: 15)),
                  const CouponButton(),
                ],
              )
            : Container(),
        const Padding(padding: EdgeInsets.only(top: 15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(left: 15)),
            URLPageButton(link: urlPageButton),
            const Padding(padding: EdgeInsets.only(left: 40)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<bool>(
                  future: checkIfLiked(markerId),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(buttonColorMenu),
                        backgroundColor: secondaryColor,
                        strokeCap: StrokeCap.round,
                        strokeWidth: 6,
                      );
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LikeButton(
                            isLiked: snapshot.data,
                            size: 70,
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
                                if (element['name'] == markerId) {
                                  markerPk = element['id'];
                                }
                              }
                              value = await fetchData(
                                  'http://localhost:8000/api/user/me');
                              var favouriteLocations =
                                  value['favorite_locations'];
                              if (isLiked) {
                                favouriteLocations.remove(markerPk);
                              } else {
                                favouriteLocations.add(markerPk);
                              }
                              await patchData(
                                  'http://localhost:8000/api/user/me/', {
                                'favorite_locations': favouriteLocations,
                              });
                              await updateFavouriteLocations();
                              return !isLiked;
                            });
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ));
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
}