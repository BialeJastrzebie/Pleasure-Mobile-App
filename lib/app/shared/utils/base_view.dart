import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../widgets/menu_list_tile.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

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
                colors: [Colors.white12, Colors.white12.withOpacity(0.3)])),
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
                margin: const EdgeInsets.only(top: 20, bottom: 60),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                ),
                child: const Image(
                  image: AssetImage("lib/app/shared/images/biała relax.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.home),
                title: "POCZĄTEK",
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.map),
                title: "MAPA",
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.calendar_view_day),
                title: "PLAN ZAJĘĆ",
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.timelapse_sharp),
                title: "Z-PLAN",
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.people_alt_outlined),
                title: "ZNAJOMI",
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.settings),
                title: "USTAWIENIA",
              ),
              const Spacer(),
              DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16,
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
          title: const Text("Base"),
          leading: IconButton(
              onPressed: _handleMenuButton,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _drawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.menu,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  })),
        ),
        body: Container(
          child: const Center(
            child: Text("Base View"),
          ),
        ),
      ),
    );
  }

  void _handleMenuButton() {
    _drawerController.showDrawer();
  }
}
