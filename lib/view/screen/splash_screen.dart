import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/view/screen/onboard_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => OnBoardScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.primary,
      body: Center(
        child: Image.asset('assets/images/logo.png',
            fit: BoxFit.fitHeight,
            height: KSize.geHeight(context, 90.8),
            width: KSize.getWidth(context, 80.87)),
      ),
    );
  }
}
