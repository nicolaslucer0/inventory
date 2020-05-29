import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../routes.dart';

class MainSpeedDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(animatedIcon: AnimatedIcons.menu_close, children: [
      SpeedDialChild(
        child: Icon(Icons.camera),
        label: "Escanear QR",
        onTap: () async {
          Navigator.pushNamed(context, formRoute);
        },
      ),
      SpeedDialChild(
        child: Icon(Icons.add),
        label: "Nuevo contenedor",
        onTap: () async {
          Navigator.pushNamed(context, formRoute);
        },
      ),
      SpeedDialChild(
        child: Icon(Icons.add),
        label: "Nuevo item",
        onTap: () async {
          Navigator.pushNamed(context, formRoute);
        },
      ),
    ]);
  }
}
