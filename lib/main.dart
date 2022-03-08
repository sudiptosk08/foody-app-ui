import 'package:flutter/material.dart';
import 'package:flutter_app/route/route_class_builder.dart';
import 'package:flutter_app/view/screen/onboard_screen.dart';
import 'package:flutter_app/view/screen/splash_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';

void main() {
  RouteClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      // ignore: deprecated_member_use
      theme: ThemeData(accentColor: KColor.primary),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/onBoardScreen': (BuildContext context) => OnBoardScreen(),
      },
    );
  }
}
