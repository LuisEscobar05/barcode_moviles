import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Page3 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Page3> {
  String _scanBarcode = 'Escanea un codigo QR para que el texto aparesca aqui';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _scanBarcode,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 90)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(24),
                ),
                child: Icon(Icons.camera),
                onPressed: () async {
                  String barcodeScanRes =
                      await FlutterBarcodeScanner.scanBarcode(
                          '#A03131', 'Cancelar', false, ScanMode.QR);
                  print("###############CODIGO############ " + barcodeScanRes);
                  _changeState(barcodeScanRes);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _changeState(String barcodeScanRes) => setState(() {
        _scanBarcode = barcodeScanRes;
      });
}
