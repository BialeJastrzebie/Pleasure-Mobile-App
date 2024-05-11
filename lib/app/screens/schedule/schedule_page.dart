import 'package:flutter/material.dart';
import '/app/shared/utils/base_view.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseView(
        body: Center(
          child: Text('Schedule goes here'),
        )
    );
  }
}
