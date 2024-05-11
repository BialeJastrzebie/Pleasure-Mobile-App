import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:inner_shadow_widget/inner_shadow_widget.dart';

import '../themes/theme.dart';
import '../widgets/menu_list_tile.dart';

class BaseView extends StatefulWidget {
  final Widget body;

  const BaseView({super.key, required this.body});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final _drawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [secondaryColor.withOpacity(0.6), secondaryColor])),
      ),
      controller: _drawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 1.0,
        )
      ], borderRadius: BorderRadius.all(Radius.circular(15))),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.black,
          iconColor: Colors.black,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  width: 120,
                  height: 120,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Image(
                    image: AssetImage("images/biała_relax.png"),
                  )),
              MenuListTile(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
                leadingIcon: const Icon(Icons.home),
                title: "POCZĄTEK",
              ),
              MenuListTile(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/map');
                },
                leadingIcon: const Icon(Icons.map),
                title: "MAPA",
              ),
              MenuListTile(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/schedule');
                },
                leadingIcon: const Icon(Icons.calendar_view_day),
                title: "PLAN ZAJĘĆ",
              ),
              MenuListTile(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/integrated_schedule');
                },
                leadingIcon: const Icon(Icons.timelapse_sharp),
                title: "Z-PLAN",
              ),
              MenuListTile(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/friends');
                },
                leadingIcon: const Icon(Icons.people_alt_outlined),
                title: "ZNAJOMI",
              ),
              const Spacer(),
              Padding(
                // Add this widget to create space from the bottom
                padding: const EdgeInsets.only(bottom: 5),
                child: Column(
                  children: [
                    MenuListTile(
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/settings');
                      },
                      leadingIcon: const Icon(Icons.settings),
                      title: "USTAWIENIA",
                    ),
                    MenuListTile(
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/help');
                      },
                      leadingIcon: const Icon(Icons.help),
                      title: "POMOC",
                    ),
                  ],
                ),
              ),
              DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: const Text(
                        "        © 2024 PŁeasure\nWszelkie prawa zastrzeżone"),
                  ))
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                const Spacer(), // push the title to the right
                GestureDetector(
                  // Wrap the Text widget with GestureDetector
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  child: const Text(
                    "PŁeasure", //title
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      shadows: [
                        Shadow(
                          offset: Offset(0.0, 3.0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            leading: IconButton(
                onPressed: _handleMenuButton,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _drawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Icon(
                          size: 35,
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    })),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: InnerShadow(
                blur: 3,
                color: Color.fromRGBO(0, 0, 0, 1),
                offset: Offset(0, 0),
                child: Divider(
                  height: 10,
                  thickness: 10,
                  color: secondaryColor,
                ),
              ),
            )),
        body: widget.body,
      ),
    );
  }

  void _handleMenuButton() {
    _drawerController.showDrawer();
  }
}
