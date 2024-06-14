import 'package:flutter/material.dart';
import '../themes/theme.dart';
class DateAndCalendar extends StatelessWidget {
  const DateAndCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
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
            child: const Center(
              child: Text(
                'Piątek',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: darkerWhiteTextColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}