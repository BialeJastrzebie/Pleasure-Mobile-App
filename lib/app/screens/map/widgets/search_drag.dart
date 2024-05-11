import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets/search_input_box.dart';

class DragFilter extends StatefulWidget {
  const DragFilter({super.key});

  @override
  State<DragFilter> createState() => _DragFilterState();
}

class _DragFilterState extends State<DragFilter> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1, // Initial height of the sheet
      minChildSize: 0.1, // Minimum height of the sheet when collapsed
      maxChildSize: 1, // Maximum height of the sheet when expanded
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: ListView(
            controller: scrollController,
            children: <Widget>[
              const SearchInputBox(),
              Center(
                child: Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              // The content you want to show when the sheet is pulled up goes here
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.red,
                child: const Center(
                  child: Text('Draggable sheet content'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
