import 'package:flutter/material.dart';
import 'package:inventory/container_screen.dart';
import 'package:inventory/scan.dart';

class MyTabbedPage extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.list)),
    Tab(icon: Icon(Icons.camera_alt)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inventory'),
          bottom: new TabBar(
            tabs: myTabs,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.teal,
                  Colors.blue,
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ContainerScreen(),
            ScanScreen(),
          ],
        ),
      ),
    );
  }
}
