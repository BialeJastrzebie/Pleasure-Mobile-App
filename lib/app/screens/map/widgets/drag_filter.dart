import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets/search_input_box.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart' as ins;

class DragFilter extends StatefulWidget {
  const DragFilter({super.key});

  @override
  State<DragFilter> createState() => _DragFilterState();
}

class _DragFilterState extends State<DragFilter> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.12,
      // Initial height of the sheet
      minChildSize: 0.1,
      // Minimum height of the sheet when collapsed
      maxChildSize: 1,
      // Maximum height of the sheet when expanded
      shouldCloseOnMinExtent: true,
      snap: true,
      // Snap the sheet to the min/max child size
      snapSizes: const [0.1, 1],
      snapAnimationDuration: const Duration(milliseconds: 300),
      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            color: backgroundColor,
          ),
          child: Center(
            child: Container(
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: secondaryColor,
                    spreadRadius: 4.0,
                    blurRadius: 20.0,
                  ),
                ],
              ),
              margin: const EdgeInsets.only(top: 1),
              width: MediaQuery.of(context).size.width * 0.8,
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 200,
                      width: 20,
                      color: Colors.black,
                      child: const Center(),
                    ),
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
