import 'package:flutter/material.dart';
import 'package:inventory/pages/tabbed_page.dart';
import 'package:inventory/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
      title: 'Inventory',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyTabbedPage(),
    );
  }
}
