import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '/app/shared/themes/theme.dart';

class SearchInputBox extends StatefulWidget {
  final VoidCallback onTap;
  final Future<GoogleMapController> mapControllerFuture;
  PanelController panelController = PanelController();
  SearchInputBox({super.key, required this.onTap, required this.mapControllerFuture, required this.panelController});

  @override
  State<SearchInputBox> createState() => _SearchInputBoxState();
}


class _SearchInputBoxState extends State<SearchInputBox> {
  final PanelController _panelController = PanelController();
  final List<String> _options = [
    'Zahir Kebab',
    'Indeks',
    'Żabka',
    'Biedronka',
    'Lidl',
    'Dino',
  ];

  navigateToLocation(LatLng location) async {
    final GoogleMapController controller = await widget.mapControllerFuture;
    controller.animateCamera(CameraUpdate.newLatLng(location));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 1),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.055,
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return _options.where((String option) {
              return option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController fieldTextEditingController,
              FocusNode fieldFocusNode,
              VoidCallback onFieldSubmitted) {
            return SearchBar(
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
              textStyle: MaterialStateProperty.all(const TextStyle(
                color: backgroundColor,
                fontWeight: FontWeight.w800,
                fontSize: 20,
              )),
              backgroundColor: MaterialStateProperty.all(buttonColorMenu),
              shadowColor: MaterialStateProperty.all(Colors.black),
              elevation: MaterialStateProperty.all(5),
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
              onSubmitted: (value) {
                LatLng location = getLocationForPlace(value);
                navigateToLocation(location);
                widget.panelController.close();
                FocusScope.of(context).unfocus();
              },
            );
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
            return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  color: Colors.transparent,
                  elevation: 4.0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.84,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                            LatLng location = getLocationForPlace(option);
                            navigateToLocation(location);
                            widget.panelController.close();
                            FocusScope.of(context).unfocus();
                          },
                          child: ListTile(
                            title: Text(option,
                                style: const TextStyle(
                                    color: backgroundColor, fontSize: 18.0)),
                            tileColor: index % 2 == 0
                                ? Colors.grey[200]
                                : Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }

  getLocationForPlace(String markerId) {
    switch (markerId) {
      case 'Zahir Kebab':
        return const LatLng(51.107883, 17.038538);
      case 'Indeks':
        return const LatLng(51.107883, 17.038538);
      case 'Żabka':
        return const LatLng(51.107883, 17.038538);
      case 'Biedronka':
        return const LatLng(51.107883, 17.038538);
      case 'Lidl':
        return const LatLng(51.107883, 17.038538);
      case 'Dino':
        return const LatLng(51.107883, 17.038538);
      default:
        return const LatLng(51.107883, 17.038538);
    }

  }
}

