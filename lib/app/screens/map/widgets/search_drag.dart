import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:pleasure_mobile_app/app/screens/map/widgets/search_input_box.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';

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
      shouldCloseOnMinExtent: true,
      snap: true,
      snapSizes: const [0.1, 1],
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: ListView(
            controller: scrollController,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 0.5, top: 5),
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
                padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 1),
                child: SearchInputBox(),
              ),
              // The content in the sheet
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.transparent,
                  child: const Center(
                      child: Text(
                    'Sheet content',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
