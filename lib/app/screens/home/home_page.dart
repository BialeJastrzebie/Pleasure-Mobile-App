import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/screens/integrated_schedule/integrated_schedule_page.dart';
import 'package:pleasure_mobile_app/app/shared/utils/base_view.dart';
import 'package:pleasure_mobile_app/app/screens/home/widgets/button.dart';

import '../../shared/utils/changeScreenAnimation.dart';
import '../friends/friends_page.dart';
import '../map/map_page.dart';
import '../schedule/schedule_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Button(
              text: "MAPA",
              onPressed: () {
                animateScreenChange(
                    context, const MapPage(), Curves.fastLinearToSlowEaseIn);
              }),
          const Spacer(),
          Button(
              text: " PLAN \nZAJĘĆ",
              onPressed: () {
                animateScreenChange(context, const SchedulePage(),
                    Curves.fastLinearToSlowEaseIn);
              }),
          const Spacer(),
          Button(
              text: "Z-PLAN",
              onPressed: () {
                animateScreenChange(context, const IntegratedSchedulePage(),
                    Curves.fastLinearToSlowEaseIn);
              }),
          const Spacer(),
          Button(
              text: "ZNAJOMI",
              onPressed: () {
                animateScreenChange(context, const FriendsPage(),
                    Curves.fastLinearToSlowEaseIn);
              }),
          const Spacer(),
        ],
      ),
    ));
  }
}
