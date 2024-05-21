
import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_map/popular_info.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_map/search_input_box.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';

import 'checkbox.dart';
import 'heading.dart';

class DragFilter extends StatefulWidget {
  final Set<String> activeFilters;
  const DragFilter({super.key, required this.activeFilters});

  @override
  State<DragFilter> createState() => _DragFilterState();
}

class _DragFilterState extends State<DragFilter> {
  get activeFilters => widget.activeFilters;


  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.12,
      // Initial height of the sheet
      minChildSize: 0.12,
      // Minimum height of the sheet when collapsed
      maxChildSize: 1,
      // Maximum height of the sheet when expanded
      shouldCloseOnMinExtent: true,
      snap: true,
      // Snap the sheet to the min/max child size
      snapSizes: const [0.12, 1],
      snapAnimationDuration: const Duration(milliseconds: 300),
      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            color: backgroundColor,
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: buttonColor,
                border: Border.all(
                  color: secondaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: Colors.black,
                    spreadRadius: 1.0,
                    blurRadius: 20.0,
                  ),
                ],
              ),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView(
                padding: const EdgeInsets.only(top: 5),
                controller: scrollController,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.5, top: 1),
                    child: Center(
                      child: InnerShadow(
                        blur: 2,
                        color: Colors.black.withOpacity(0.8),
                        offset: const Offset(0, 0),
                        child: Container(
                          // draggable divider
                          width: 180,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 1),
                    child: SearchInputBox(),
                  ),
                  // The content in the sheet
                  const HeadingText(text: 'POPULARNE:'),
                  const PopularInfo(text: 'Indeks'),
                  const PopularInfo(text: 'Klub Tago'),
                  const HeadingText(text: 'FILTRY:'),
                  CheckboxFilter(
                    filter: Filter(id: 'favourite', name: 'Ulubione'),
                    onChanged: (bool value) {
                      setState(() {
                        if (value) {
                          activeFilters.add('favourite');
                          print(activeFilters);
                        } else {
                          activeFilters.remove('favourite');
                        }
                      });
                    },
                  ),
                  CheckboxFilter(
                    filter: Filter(id: 'restaurants', name: 'Restauracje'),
                    onChanged: (bool value) {
                      setState(() {
                        if (value) {
                          activeFilters.add('restaurants');
                          print(activeFilters);
                        } else {
                          activeFilters.remove('restaurants');
                        }
                      });
                    },
                  ),
                  CheckboxFilter(
                    filter: Filter(id: 'theatre', name: 'Teatry'),
                    onChanged: (bool value) {
                      setState(() {
                        if (value) {
                          activeFilters.add('theatre');
                          print(activeFilters);
                        } else {
                          activeFilters.remove('theatre');
                        }
                      });
                    },
                  ),
                  CheckboxFilter(
                    filter: Filter(id: 'pubs', name: 'Puby'),
                    onChanged: (bool value) {
                      setState(() {
                        if (value) {
                          activeFilters.add('pubs');
                          print(activeFilters);
                        } else {
                          activeFilters.remove('pubs');
                        }
                      });
                    },
                  ),
                  CheckboxFilter(
                    filter: Filter(id: 'clubs', name: 'Kluby'),
                    onChanged: (bool value) {
                      setState(() {
                        if (value) {
                          activeFilters.add('clubs');
                        } else {
                          activeFilters.remove('clubs');
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
