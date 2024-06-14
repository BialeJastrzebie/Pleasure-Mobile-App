import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';
import 'widgets/schedule_box.dart';
import '../../shared/widgets/date_and_calendar.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              DateAndCalendar(),
              SizedBox(height: 10),
              ScheduleBox(),
              ScheduleBox(),
            ],
          ),
        ),
      ),
    );
  }
}