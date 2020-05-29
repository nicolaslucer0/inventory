import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory/shadow/shadow_icon.dart';

import 'container_screen.dart';
import 'scan.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  DateTime lastUpdated;

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return ContainerScreen();
      case 1:
        return ScanScreen();
      case 2:
        return ContainerScreen();
      case 3:
        return ScanScreen();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ShadowIcon(
                Icons.home,
                offsetX: 0.0,
                offsetY: 0.0,
                blur: 3.0,
                shadowColor: Colors.black.withOpacity(0.25),
              ),
            ),
            BottomNavigationBarItem(
              icon: ShadowIcon(
                Icons.list,
                offsetX: 0.0,
                offsetY: 0.0,
                blur: 3.0,
                shadowColor: Colors.black.withOpacity(0.25),
              ),
            ),
            BottomNavigationBarItem(
              icon: ShadowIcon(
                Icons.settings,
                offsetX: 0.0,
                offsetY: 0.0,
                blur: 3.0,
                shadowColor: Colors.black.withOpacity(0.25),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          iconSize: 28.0,
          activeColor: const Color(0xFF4c9bfb),
          inactiveColor: const Color(0xFFa3a3a3),
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                  child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: _getBody(index),
                  ),
                ],
              ));
            },
          );
        },
      ),
    );
  }
}
