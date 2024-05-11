import 'package:flutter/material.dart';
import '/app/shared/utils/base_view.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseView(
        body: Center(
          child: Text('Location goes here'),
        )
    );
  }
}
