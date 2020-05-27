import 'package:flutter/material.dart';
import 'package:inventory/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Generator-Scanner',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.teal,
                    Colors.blue,
                  ],
                )),
              ),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.camera_alt)),
                  Tab(icon: Icon(Icons.list)),
                  Tab(icon: Icon(Icons.settings)),
                ],
              ),
              title: Text('Tabs Demo'),
            ),
            body: TabBarView(
              children: [
                HomeScreen(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ));
  }
}
