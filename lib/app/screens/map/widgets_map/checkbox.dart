import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';
import 'package:provider/provider.dart';

import '../filter_state.dart';

class Filter {
  final String id;
  final String name;

  Filter({required this.id, required this.name});
}

class CheckboxFilter extends StatefulWidget {
  final Filter filter;

  const CheckboxFilter({super.key, required this.filter});

  @override
  State<CheckboxFilter> createState() => _CheckboxFilterState();
}

class _CheckboxFilterState extends State<CheckboxFilter> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final filterState = Provider.of<FilterState>(context);
    isChecked = filterState.activeFilters.contains(widget.filter.id);

    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 10)),
        SizedBox(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
                if (isChecked) {
                  filterState.addFilter(widget.filter.id);
                } else {
                  filterState.removeFilter(widget.filter.id);
                }
                print(filterState.activeFilters);
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
        ),
        const Padding(padding: EdgeInsets.only(left: 20)),
        Text(
          widget.filter.name,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: darkerWhiteTextColor,
            shadows: [
              Shadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
