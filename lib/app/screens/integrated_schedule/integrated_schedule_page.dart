import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';
import 'widgets/integrated_schedule_box.dart';
import '../../shared/widgets/date_and_calendar.dart'; // Import nowego pliku

class IntegratedSchedulePage extends StatelessWidget {
  const IntegratedSchedulePage({Key? key}) : super(key: key);

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
              IntegratedScheduleBox(),
              SizedBox(height: 10),
              IntegratedScheduleBox(),
            ],
          ),
        ),
      ),
    );
  }
}