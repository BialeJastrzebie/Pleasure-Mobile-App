import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';

class IntegratedSchedulePage extends StatefulWidget {
  const IntegratedSchedulePage({super.key});

  @override
  IntegratedSchedulePageState createState() => IntegratedSchedulePageState();
}

class IntegratedSchedulePageState extends State<IntegratedSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return const BaseView(
        body: Center(
          child: Text('IntegratedSchedulePage goes here'),
        )
    );
  }
}
