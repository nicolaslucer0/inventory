import 'package:flutter/material.dart';
import 'package:inventory/main.dart';
import 'package:inventory/pages/formulario.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MyApp());
      case formRoute:
        return MaterialPageRoute(builder: (_) => ContainerForm());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}


const String homeRoute = '/';
const String formRoute = '/feed';