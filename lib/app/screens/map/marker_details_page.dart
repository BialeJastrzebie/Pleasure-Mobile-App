import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/address_text.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/coupon_button.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/coupon_info.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_description.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_image.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/opinion_button.dart';
import 'package:pleasure_mobile_app/app/shared/utils/base_view.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '../../shared/themes/theme.dart';

class MarkerDetailsPage extends StatelessWidget {
  final String markerId;

  const MarkerDetailsPage({super.key, required this.markerId});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        body: Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          children: [
            const Padding(padding: EdgeInsets.only(left: 10)),
            const LocationImage(path: 'images/kebab.png'),
            const Padding(padding: EdgeInsets.only(left: 30)),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 15)),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: InnerShadow(
                    blur: 0.5,
                    color: Colors.black,
                    offset: Offset(1, 2),
                    child: Text(
                      'Zahir Kebab',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: darkerWhiteTextColorLocation,
                        shadows: [
                          Shadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                const AddressText(address: 'Radwańska 52'),
              ],
            ),
          ],
        ),
        const DescriptionText(
            description:
                'Soczysty kebab, przygotowany z delikatnego, soczystego mięsa, świeżych warzyw i zawinięty w ciepły, miękki chleb. Przyprawiony mieszanką tradycyjnych przypraw, oferuje doskonałą równowagę smaków. Dlatego przygotowaliśmy dla Ciebie niesamowitą ofertę!'),
        const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CouponInfo(text: 'Kup 2 kebaby,\n3. za darmo!'),
              Padding(padding: EdgeInsets.only(left: 15)),
              CouponButton(),
        ]),
        const Padding(padding: EdgeInsets.only(top: 15)),
        const OpinionButton(link: 'https://www.google.com'),
      ],
    ));
  }
}
