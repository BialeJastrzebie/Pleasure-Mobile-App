import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
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

  const MarkerDetailsPage(
      {super.key,
      required this.markerId,
      required this.image,
      required this.description,
      required this.address,
      required this.couponInfo,
      required this.urlPageButton});

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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 4,
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LikeButton(
                  size: 70,
                  circleColor:
                      CircleColor(start: Colors.white, end: Colors.white),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.black,
                    dotSecondaryColor: secondaryColor,
                    dotThirdColor: buttonColorMenu,
                    dotLastColor: buttonColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
