import 'package:flutter/material.dart';
import '../../../shared/themes/theme.dart';
class IntegratedScheduleBox extends StatelessWidget {
  const IntegratedScheduleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              color: buttonColorMenu,
              borderRadius: BorderRadius.circular(21.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
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
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  '9:00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkerWhiteTextColor,

                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 12.0,
            top: MediaQuery.of(context).size.height * 0.06,
            child: Text(
              'Igor Frątczak, Krystian Juszczyk',
              style: TextStyle(
                color: backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
