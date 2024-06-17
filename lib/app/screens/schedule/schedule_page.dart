import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';
import 'widgets/schedule_box.dart';
import '../../shared/widgets/date_and_calendar.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  SchedulePageState createState() => SchedulePageState();
}

class SchedulePageState extends State<SchedulePage> {
  String selectedDay = 'Piątek';
  Map<String, List<Map<String, String>>> schedule = {
    'Poniedziałek': [
      {'startTime': '8:15', 'endTime': '10:00', 'sala': 'WEEIA E1', 'subject': 'Systemy Wbudowane'},
      {'startTime': '10:15', 'endTime': '12:00', 'sala': 'DCMS', 'subject': 'Sieci komputerowe'},
    ],
    'Wtorek': [
      {'startTime': '8:15', 'endTime': '10:00', 'sala': 'WEEIA E1', 'subject': 'Projektowanie aplikacji'},
      {'startTime': '10:15', 'endTime': '12:00', 'sala': 'DCMS', 'subject': 'PP2'},
      {'startTime': '13:00', 'endTime': '14:45', 'sala': 'WEEIA E3', 'subject': 'Podstawy elektroniki'},
    ],
    'Środa': [
      {'startTime': '8:15', 'endTime': '10:00', 'sala': 'DCMS', 'subject': 'PP2'},
    ],
    'Czwartek': [
      {'startTime': '8:15', 'endTime': '10:00', 'sala': 'WEEIA E1', 'subject': 'SO2'},
      {'startTime': '10:15', 'endTime': '12:00', 'sala': 'DCMS ', 'subject': 'Sieci komputerowe'},
    ],
    'Piątek': [
      {'startTime': '8:15', 'endTime': '10:00', 'sala': 'WEEIA E1', 'subject': 'PIO'},
      {'startTime': '10:15', 'endTime': '12:00', 'sala': 'WEEIA E2', 'subject': 'KCK'},
    ],
  };

  void _addLesson() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String startTime = '';
        String endTime = '';
        String sala = '';
        String subject = '';

        return AlertDialog(
          title: Text('Dodaj lekcję'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  startTime = value;
                },
                decoration: InputDecoration(labelText: 'Godzina rozpoczęcia'),
              ),
              TextField(
                onChanged: (value) {
                  endTime = value;
                },
                decoration: InputDecoration(labelText: 'Godzina zakończenia'),
              ),
              TextField(
                onChanged: (value) {
                  sala = value;
                },
                decoration: InputDecoration(labelText: 'Sala'),
              ),
              TextField(
                onChanged: (value) {
                  subject = value;
                },
                decoration: InputDecoration(labelText: 'Przedmiot'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  schedule[selectedDay]!.add({
                    'startTime': startTime,
                    'endTime': endTime,
                    'sala': sala,
                    'subject': subject,
                  });
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0), // Dodanie marginesu górnego
            child: DateAndCalendar(
              selectedDay: selectedDay,
              onDaySelected: (day) {
                setState(() {
                  selectedDay = day; // Aktualizuj wybrany dzień
                });
              },
              onAddLesson: _addLesson, // Przekazanie funkcji do dodawania lekcji
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Dodanie paddingu do kontenera
              child: ListView(
                children: [
                  ...schedule[selectedDay]!.map((lesson) {
                    return ScheduleBox(
                      startTime: lesson['startTime']!,
                      endTime: lesson['endTime']!,
                      sala: lesson['sala']!,
                      subject: lesson['subject']!,
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}