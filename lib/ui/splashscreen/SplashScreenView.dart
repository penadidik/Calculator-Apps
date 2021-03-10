import 'dart:async';

import 'package:calculator_apps/ui/home/Home.dart';
import 'package:calculator_apps/util/AppRouter.dart';
import 'package:calculator_apps/util/Assets.dart';
import 'package:calculator_apps/util/Colors.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  String pageTitle = "";

  SplashScreenView({this.pageTitle});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenView> {
  startTime() async {
    var _duration = new Duration(seconds: 10);
    return new Timer(_duration, _goRouter);
  }

  void _goRouter() {
    AppsRouter.makeFirst(context, Home());
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsState.backgroundColor,
      body: Container(
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(top: 180),
                alignment: Alignment.topCenter,
                child: Image.asset(Assets.logo_splashscreen, width: 250, height: 250,)),
            Container(
                margin: EdgeInsets.only(bottom: 50),
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Version 1.01.1',
                  style: TextStyle(color: ColorsState.labelColor, fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }
}