import 'package:flutter/material.dart';
import 'package:inventory/pages/tabbed_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyTabbedPage(),
    );
  }
}
