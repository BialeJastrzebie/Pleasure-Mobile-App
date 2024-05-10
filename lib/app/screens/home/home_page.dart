import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/utils/base_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseView(
      body: Center(
        child: Text('Home goes here'),
      )
    );
  }
}