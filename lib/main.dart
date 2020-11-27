import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
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
  ArView arView = ArView();

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
          backgroundColor: Color.fromRGBO(0, 181, 117, 1),
        ),
        body: SizedBox.expand(
            child: Stack(children: <Widget>[
          // Center(
          //   child: Text('tes'),
          // ),
          ArCoreView(onArCoreViewCreated: arView.onArCoreViewCreated),
          modalBottom
        ])));
  }
}
