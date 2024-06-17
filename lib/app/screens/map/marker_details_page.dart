import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:pleasure_mobile_app/app/screens/login/login_page.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/address_text.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/coupon_button.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/coupon_info.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/like_button_location.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_description.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_image.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_name.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/navigate_to_location_button.dart';
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
  final LatLng navLocation;
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
    required this.navLocation,
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
                  CouponButton(markerId: markerId),
                ],
              )
            : const SizedBox(),
const Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(left: 35)),
            URLPageButton(link: urlPageButton),
            const Spacer(),
            NavigateToLocationButton(location: navLocation),
            const Spacer(),
            MyLikeButton(
                markerId: markerId,
                updateFavouriteLocations: updateFavouriteLocations),
            const Padding(padding: EdgeInsets.only(right: 35)),
          ],
        ),
      ],
    ));
  }
}
