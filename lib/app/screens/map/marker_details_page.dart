import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/utils/base_view.dart';

class MarkerDetailsPage extends StatelessWidget {
  final String markerId;

  const MarkerDetailsPage({super.key, required this.markerId});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: Text('Details for marker: $markerId'),
      ),
    );
  }
}