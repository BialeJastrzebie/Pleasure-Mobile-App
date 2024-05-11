import 'package:flutter/material.dart';
import '/app/shared/utils/base_view.dart';

class IntegratedSchedulePage extends StatefulWidget {
  const IntegratedSchedulePage({Key? key}) : super(key: key);

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
