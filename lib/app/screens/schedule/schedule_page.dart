import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return const BaseView(
      body: Center(
        child: ScheduleBox(),
      ),
    );
  }
}

class ScheduleBox extends StatelessWidget {
  const ScheduleBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.10,
          decoration: BoxDecoration(
            color: Color(0xFFFFFEFE),
            borderRadius: BorderRadius.circular(21.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Kolor cienia
                spreadRadius: 5, // Jak bardzo cień się rozprzestrzenia
                blurRadius: 7, // Promień rozmycia
                offset: Offset(0, 3), // Pozycja cienia (x, y)
              ),
            ],
          ),
        ),
        Positioned(
          left: 10.0,
          top: 10.0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.height * 0.038,
            decoration: BoxDecoration(
              color: Color(0xFF7F0000),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                '9:00', // Twój tekst tutaj
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Styl tekstu
                  color: Colors.white, // Kolor tekstu
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 12.0,
          top: MediaQuery.of(context).size.height * 0.06, // Pozycja tekstu pod czerwonym boxem
          child: Text(
            'Igor Frątczak, Krystian Juszczyk',
              style: TextStyle(
                color: Color(0xFF7F0000), // Kolor tekstu
              )),
        ),
      ],
    );
  }
}