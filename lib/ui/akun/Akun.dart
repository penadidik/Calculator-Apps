import 'package:calculator_apps/ui/Presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AkunView.dart';

class Akun extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ChangeNotifierProvider(
          create: (context) => Presenter(),
          child: AkunView(pageTitle: "Akun"),
        )
    );
  }

}