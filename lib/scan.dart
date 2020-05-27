import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen>  with SingleTickerProviderStateMixin {
  String barcode = "";
  @override
  initState() {
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(),
      floatingActionButton: FloatingActionButton(
          splashColor: Colors.blueGrey,
          onPressed: scan,
          child: Icon(Icons.camera_alt)),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() {
        this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)';
      });
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
