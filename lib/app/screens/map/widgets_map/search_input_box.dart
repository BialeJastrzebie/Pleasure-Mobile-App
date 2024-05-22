import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '/app/shared/themes/theme.dart';

class SearchInputBox extends StatefulWidget {
  final VoidCallback onTap;


  const SearchInputBox({super.key, required this.onTap});

  @override
  State<SearchInputBox> createState() => _SearchInputBoxState();
}

class _SearchInputBoxState extends State<SearchInputBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 1),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.055,
          child: SearchBar(
            textStyle: MaterialStateProperty.all(const TextStyle(
              color: backgroundColor,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            )),
            backgroundColor: MaterialStateProperty.all(buttonColorMenu),
            shadowColor: MaterialStateProperty.all(Colors.black),
            elevation: MaterialStateProperty.all(8),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            )),
            leading: InnerShadow(
              blur: 2,
              color: Colors.black.withOpacity(0.8),
              offset: const Offset(0, 0),
              child: const Icon(
                Icons.search,
                size: 38.0,
                color: secondaryColor,
              ),
            ),
            hintText: 'Wyszukaj',
            hintStyle: MaterialStateProperty.all(const TextStyle(
              color: secondaryColor,
              fontSize: 20,
            )),
            onChanged: (value) {},
            onTap: () {
              widget.onTap();
            },
          ),
        ),
    );
  }
}
