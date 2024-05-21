import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';

class AddressText extends StatelessWidget {
  final String address;

  const AddressText({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Text(
      address,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: darkerWhiteTextColor,
      ),
    );
  }
}