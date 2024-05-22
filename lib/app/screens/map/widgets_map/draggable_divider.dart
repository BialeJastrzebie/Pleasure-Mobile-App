import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';


import '../../../shared/themes/theme.dart';

class DraggableDivider extends StatefulWidget {
  const DraggableDivider({super.key});

  @override
  State<DraggableDivider> createState() => _DraggableDividerState();
}

class _DraggableDividerState extends State<DraggableDivider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.5, top: 6, left: 110),
      child: Center(
        child: InnerShadow(
          blur: 2,
          color: Colors.black.withOpacity(0.8),
          offset: const Offset(0, 0),
          child: Container(
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
    );
  }
}
