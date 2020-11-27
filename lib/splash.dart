import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/logo.png',
              scale: 2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Kenali',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 42,
                color: Color.fromRGBO(0, 181, 117, 1)),
          ),
        ],
      ),
    );
  }
}
