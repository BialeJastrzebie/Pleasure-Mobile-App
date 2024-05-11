import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/utils/base_view.dart';
import 'package:pleasure_mobile_app/app/screens/home/widgets/button.dart';

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
                  Navigator.popAndPushNamed(context, '/map');
                }
            ),
            const Spacer(),
            Button(
                text: " PLAN \nZAJĘĆ",
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/schedule');
                }
            ),
            const Spacer(),
            Button(
                text: "Z-PLAN",
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/integrated_schedule');
                }
            ),
            const Spacer(),
            Button(
                text: "ZNAJOMI",
                onPressed: () {
                  // Navigator.popAndPushNamed(context, '/friends');
                }
            ),
            const Spacer(),
          ],
        ),
      )
    );
  }
}