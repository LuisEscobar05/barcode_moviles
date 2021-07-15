import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomCamera extends StatelessWidget {
  String barcodeScanRes = "";
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.camera, color: Colors.blue,),
        backgroundColor: Colors.black,
        onPressed: () async {
          barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#A03131', 'Cancelar', false, ScanMode.QR);
          print("###############CODIGO############ "+barcodeScanRes);
          _launchURL();
        });
  }
  void _launchURL() async => await canLaunch(barcodeScanRes) ? await launch(barcodeScanRes) : throw 'Could not launch $barcodeScanRes';
}
