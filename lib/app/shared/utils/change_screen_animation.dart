import 'package:flutter/material.dart';

void animateScreenChange(BuildContext context, StatelessWidget screen, Curve typeOfCurve) {
  Navigator.push(context, PageRouteBuilder(
    pageBuilder: (context, animation1, animation2) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = typeOfCurve;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 800), // Extend the transition duration
  ));
}