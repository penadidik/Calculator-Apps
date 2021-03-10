import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Presenter.dart';
import 'RiwayatView.dart';

class Riwayat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ChangeNotifierProvider(
          create: (context) => Presenter(),
          child: RiwayatView(pageTitle: "Riwayat"),
        )
    );
  }

}