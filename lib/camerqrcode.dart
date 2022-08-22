import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'main.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
 final String title;
  @override
  State<ScanQr> createState() => _MyScanQrState();
}

class _MyScanQrState extends State<ScanQr> {
  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;
  Barcode? result;

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 400,
                  width: 400,
                  child: QRView(
                    key: _globalKey,
                    onQRViewCreated: qr,
                  )
              ),
              Center(
                child: (result != null) ? Text('${result!.code}') : Text(
                    'Scanner un QR CODE'),

              )
            ],
          ),
        )
    );
  }
}