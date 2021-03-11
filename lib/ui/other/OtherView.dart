import 'package:calculator_apps/util/Assets.dart';
import 'package:calculator_apps/util/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Presenter.dart';

class OtherView extends StatefulWidget {
  String pageTitle = "";

  OtherView({this.pageTitle});

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherView> {
  Presenter presenter;

  @override
  void initState() {
    presenter = new Presenter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size screen = MediaQuery.of(context).size;
    double  buttonSize = screen.width/3.5;
    double displayHeight = screen.height - (buttonSize * 5) - (buttonSize);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsState.backgroundColor,
        automaticallyImplyLeading: false,
        title: Image.asset(Assets.icon_calculator, width: 180,),
        actions: <Widget>[
        ],
      ),
      backgroundColor: Color(0xffF1BC19),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ],
          ),
        ),
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: presenter.page,
            onTap: (index) {
              switch (index) {
                case 0:
                  presenter.openPage(0, context);
                  break;
                case 1:
                  presenter.openPage(1, context);
                  break;
                case 2:
                  presenter.openPage(2, context);
                  break;
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: presenter.page == 0 ? Color(0xff8382AF) : Colors.grey,
                ),
                title: new Text(
                  'Home',
                  style: TextStyle(
                      color: presenter.page == 0 ? Color(0xff8382AF) : Colors.grey),
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    color: presenter.page == 1 ? Color(0xff8382AF) : Colors.grey,
                  ),
                  title: Text(
                    'Riwayat',
                    style: TextStyle(
                        color: presenter.page == 1 ? Color(0xff8382AF) : Colors.grey),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: presenter.page == 2 ? Color(0xff8382AF) : Colors.grey,
                  ),
                  title: Text(
                    'Akun',
                    style: TextStyle(
                        color: presenter.page == 2 ? Color(0xff8382AF) : Colors.grey),
                  )),
            ]),
      ),
    );
  }
}