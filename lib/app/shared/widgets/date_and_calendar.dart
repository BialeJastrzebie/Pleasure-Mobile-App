import 'package:flutter/material.dart';
import '../themes/theme.dart'; // Zakładając, że 'themes/theme.dart' jest dostępny w odpowiednim miejscu

class DateAndCalendar extends StatelessWidget {
  final String selectedDay;
  final Function(String) onDaySelected;
  final Function() onAddLesson; // Dodana funkcja do dodawania lekcji

  const DateAndCalendar({
    Key? key,
    required this.selectedDay,
    required this.onDaySelected,
    required this.onAddLesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: backgroundColor, // Kolor tła
                  title: Text(
                    'Wybierz dzień',
                    style: TextStyle(color: Colors.white), // Kolor tekstu
                  ),
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
        const Spacer(),
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
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: darkerWhiteTextColor, // Kolor tekstu
              ),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.white, width: 2.0),
          ),
          child: IconButton(
            onPressed: onAddLesson,
            icon: Icon(Icons.add, color: Colors.white), // Kolor ikony
          ),
        ),
      ],
    );
  }

  Widget _buildDayButton(BuildContext context, String day) {
    return TextButton(
      onPressed: () {
        onDaySelected(day); // Wywołaj funkcję zwrotną, aby zaktualizować wybrany dzień
        Navigator.of(context).pop(); // Zamknij dialog
      },
      child: Text(
        day,
        style: TextStyle(color: Colors.white), // Kolor tekstu
      ),
    );
  }
}
