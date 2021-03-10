import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SplashScreenPresenter.dart';
import 'SplashScreenView.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ChangeNotifierProvider(
          create: (context) => SplashScreenPresenter(),
          child: SplashScreenView(pageTitle: "Splash Screen"),
        )
    );
  }

}