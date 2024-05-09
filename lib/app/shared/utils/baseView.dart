import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../widgets/MenuListTile.dart';

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
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white54, Colors.white54.withOpacity(0.2)])),
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
                child: const FlutterLogo(),
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.home),
                title: const Text("Strona główna"),
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.map),
                title: const Text("Mapa"),
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.schedule),
                title: const Text("Plan zajęć"),
              ),
              MenuListTile(
                onTap: () {},
                leadingIcon: const Icon(Icons.timelapse_sharp),
                title: const Text("Z-Plan"),
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
                    child: const Text("Privacy Policy"),
                  ))
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Base"),
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
        body: Container(),
      ),
    );
  }

  void _handleMenuButton() {
    _drawerController.showDrawer();
  }
}
