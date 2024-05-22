import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_map/popular_info.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets_map/search_input_box.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../shared/themes/theme.dart';
import 'checkbox.dart';
import 'draggable_divider.dart';
import 'heading.dart';

class SlidingPanel extends StatefulWidget {
  const SlidingPanel({super.key});

  @override
  State<SlidingPanel> createState() => _SlidingPanelState();
}

class _SlidingPanelState extends State<SlidingPanel> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _panelController,
      header: const DraggableDivider(),
      minHeight: MediaQuery.of(context).size.height * 0.12,
      maxHeight: MediaQuery.of(context).size.height,
      panel: DecoratedBox(
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
                  offset: Offset(0, 5),
                  color: Colors.black,
                  spreadRadius: 2.0,
                  blurRadius: 15.0,
                ),
              ],
            ),
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView(
              padding: const EdgeInsets.only(top: 5),
              children: <Widget>[
                SearchInputBox(
                  onTap: () {
                    if (!_panelController.isPanelOpen) {
                      _panelController.open();
                    }
                  },
                ),
                const HeadingText(text: 'POPULARNE:'),
                const PopularInfo(text: 'Indeks'),
                const PopularInfo(text: 'Klub Tago'),
                const HeadingText(text: 'FILTRY:'),
                CheckboxFilter(
                    filter: Filter(id: 'favourite', name: 'Ulubione')),
                CheckboxFilter(
                  filter: Filter(id: 'restaurants', name: 'Restauracje'),
                ),
                CheckboxFilter(
                  filter: Filter(id: 'theatre', name: 'Teatry'),
                ),
                CheckboxFilter(
                  filter: Filter(id: 'pubs', name: 'Puby'),
                ),
                CheckboxFilter(
                  filter: Filter(id: 'clubs', name: 'Kluby'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
