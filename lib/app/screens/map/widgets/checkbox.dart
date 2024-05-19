import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';

class CheckboxFilter extends StatefulWidget {
  final String text;

  const CheckboxFilter({super.key, required this.text});

  @override
  State<CheckboxFilter> createState() => _CheckboxFilterState();
}

class _CheckboxFilterState extends State<CheckboxFilter> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: isChecked ? checkBox : buttonColor,
            border: Border.all(
              color: secondaryColor,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5),
                color: Colors.black,
                spreadRadius: 1.0,
                blurRadius: 10.0,
              ),
            ],
          ),
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: isChecked
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
