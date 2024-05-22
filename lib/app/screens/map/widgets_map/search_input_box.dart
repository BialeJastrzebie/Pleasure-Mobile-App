import 'package:flutter/material.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import '/app/shared/themes/theme.dart';

class SearchInputBox extends StatefulWidget {
  const SearchInputBox({super.key});

  @override
  State<SearchInputBox> createState() => _SearchInputBoxState();
}

class _SearchInputBoxState extends State<SearchInputBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.05,
      child: SearchBar(
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
      ),
    );
  }
}
