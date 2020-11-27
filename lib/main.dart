import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/foundation.dart';
import 'ar_object.dart';
import 'ar_view.dart';
import 'modal_bottom.dart';
import 'splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kenali',
      home: Splash(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MyHomePage(title: 'Kenali'),
      },
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
  bool isARActivated = false;
  String barcode = "";

  Widget changeARWidget(bool _isARActivated) {
    if (!_isARActivated) {
      return QRView(
        key: qrKey,
        onQRViewCreated: (controller) {
          controller.scannedDataStream.listen((value) {
            setState(() {
              barcode = value;
              isARActivated = true;
            });
          });
        },
      );
    }
    return ARObject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(0, 181, 117, 1),
      ),
      body: ARObject(),
      // SizedBox.expand(
      //     child: Stack(children: <Widget>[
      //   changeARWidget(isARActivated),
      //   modalBottom(barcode)
      // ]))
    );
  }
}
