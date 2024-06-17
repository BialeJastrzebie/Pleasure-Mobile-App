import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';
import 'widgets/integrated_schedule_box.dart';
import 'widgets/date_integrate.dart'; // Import nowego pliku

class IntegratedSchedulePage extends StatelessWidget {
  const IntegratedSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              DateIntegrate(),
              SizedBox(height: 10),
              IntegratedScheduleBox(
                time: '9:00',
                participants: 'Igor Frątczak, Krystian Juszczyk',
              ),
              SizedBox(height: 10),
              IntegratedScheduleBox(
                time: '10:00',
                participants: 'Anna Kowalska, Jan Nowak',
              ),
            ],
          ),
        ),
      ),
    );
  }
}