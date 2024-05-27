import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/address_text.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/coupon_button.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/coupon_info.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_description.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/location_image.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_marker_details/url_page_button.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '../../shared/themes/theme.dart';
import '../../shared/utils/data_fetch.dart';

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
            const LocationImage(path: 'images/kebab.png'),
            const Spacer(),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 15)),
                SizedBox(//the position of like button
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Row(children: [
                    Spacer(),
                    LikeButton(
                      size: 50,
                      circleColor:
                      CircleColor(start: Colors.white, end: Colors.white),
                      bubblesColor: BubblesColor(
                          dotPrimaryColor: Colors.black,
                          dotSecondaryColor: secondaryColor,
                        dotThirdColor: buttonColorMenu,
                        dotLastColor: buttonColor,
                      ),
                    ),
                  ]),
                ),
                const InnerShadow(
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
            const Padding(padding: EdgeInsets.only(right: 10)),
          ],
        ),
        const DescriptionText(
            description:
                'Soczysty kebab, przygotowany z delikatnego, soczystego mięsa, świeżych warzyw i zawinięty w ciepły, miękki chleb. Przyprawiony mieszanką tradycyjnych przypraw, oferuje doskonałą równowagę smaków. Dlatego przygotowaliśmy dla Ciebie niesamowitą ofertę!'),
        const Padding(padding: EdgeInsets.only(top: 20)),
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CouponInfo(text: 'Kup 2 kebaby,\n3. za darmo!'),
          Padding(padding: EdgeInsets.only(left: 15)),
          CouponButton(),
        ]),
        const Padding(padding: EdgeInsets.only(top: 25)),
        const URLPageButton(
            link:
                'https://www.google.com/search?q=zahir+kebab%2C+radwa%C5%84ska+32%2C+90-541+%C5%82%C3%B3d%C5%BA&sca_esv=e29bad09a751d822&sca_upv=1&hl=pl&gl=PL&sxsrf=ADLYWIKiu9i2xYYW7qoN_i9LGT_Q24EG_w%3A1716324967905&ei=ZwpNZsf0NvqiwPAP4qebuAo&udm=&oq=&gs_lp=Egxnd3Mtd2l6LXNlcnAiACoCCAAyBxAjGCcY6gIyBxAjGCcY6gIyBxAjGCcY6gIyBxAjGCcY6gIyBxAjGCcY6gIyBxAjGCcY6gIyBxAjGCcY6gIyBxAjGCcY6gIyBxAjGCcY6gIyBxAjGCcY6gIyEBAAGAMYtAIY6gIYjwHYAQEyEBAAGAMYtAIY6gIYjwHYAQEyEBAAGAMYtAIY6gIYjwHYAQEyEBAAGAMYtAIY6gIYjwHYAQEyEBAuGAMYtAIY6gIYjwHYAQEyEBAAGAMYtAIY6gIYjwHYAQEyEBAAGAMYtAIY6gIYjwHYAQEyEBAuGAMYtAIY6gIYjwHYAQEyEBAuGAMYtAIY6gIYjwHYAQEyEBAAGAMYtAIY6gIYjwHYAQFImKoKUIYHWOm9AXADeACQAQCYAXOgAboBqgEDMS4xuAEByAEA-AEC-AEBmAIEoAKcAagCFMICChAAGLADGNYEGEfCAgcQIxiwAxgnwgIIEAAYgAQYogSYAxqIBgGQBgm6BgYIARABGAqSBwMzLjGgB5MJ&sclient=gws-wiz-serp'),
      ],
    ));
  }
}

Future<Map<String, dynamic>> getLocationDetails(String url) async {
  var data = await fetchData(url);
  if (data is List && data.isNotEmpty) {
    var location = data.first;
    if (location is Map) {
      return {
        'name': location['name'],
        'coupon': location['coupon'],
        'latitude': location['latitude'],
        'longitude': location['longitude'],
        'address': location['address'],
        'description': location['description'],
      };
    }
  }
  throw Exception('Failed to get location details');
}
