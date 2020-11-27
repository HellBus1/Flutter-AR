import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'ar_view.dart';
import 'modal_bottom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botani',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Botani'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey qrKey = GlobalKey();
  ArView arView = ArView();
  String barcode = "";

  @override
  void dispose() {
    arView.arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff3f3f3),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SizedBox.expand(
            child: Stack(children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: (controller) {
              controller.scannedDataStream.listen((value) {
                setState(() {
                  barcode = value;
                });
              });
            },
          ),

          // ArCoreView(onArCoreViewCreated: arView.onArCoreViewCreated),
          modalBottom(barcode)
        ])));
  }
}
