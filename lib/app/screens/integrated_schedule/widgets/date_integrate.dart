import 'package:flutter/material.dart';
import '../../../shared/themes/theme.dart'; // Zakładając, że 'themes/theme.dart' jest dostępny w odpowiednim miejscu

class DateIntegrate extends StatefulWidget {
  const DateIntegrate({Key? key}) : super(key: key);

  @override
  _DateIntegrateState createState() => _DateIntegrateState();
}

class _DateIntegrateState extends State<DateIntegrate> {
  String selectedDay = 'Piątek'; // Domyślnie ustawiamy na 'Piątek'

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: backgroundColor,
                  title: Text('Wybierz dzień'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDayButton(context, 'Poniedziałek'),
                      _buildDayButton(context, 'Wtorek'),
                      _buildDayButton(context, 'Środa'),
                      _buildDayButton(context, 'Czwartek'),
                      _buildDayButton(context, 'Piątek'),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            margin: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'images/calendar_icon.png',
                width: 70,
                height: 70,
              ),
            ),
          ),
        ),
        SizedBox(width: 40),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              selectedDay,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: darkerWhiteTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDayButton(BuildContext context, String day) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedDay = day; // Ustaw wybrany dzień na kliknięty dzień
        });
        Navigator.of(context).pop(); // Zamknij dialog
      },
      child: Text(day,
      style: const TextStyle(color: Colors.white),),
    );
  }
}