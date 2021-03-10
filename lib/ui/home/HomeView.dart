import 'dart:async';

import 'package:calculator_apps/ui/Presenter.dart';
import 'package:calculator_apps/util/Assets.dart';
import 'package:calculator_apps/util/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home.dart';
import 'calculator/CalculatorAdapter.dart';
import 'calculator/CalculatorModel.dart';

class HomeView extends StatefulWidget {
  String pageTitle = "";

  HomeView({Key key, this.pageTitle}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {

  Presenter homePresenter;

  @override
  void initState() {
    homePresenter = new Presenter();
    homePresenter.start(this);
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
              Display(value: homePresenter.output, height: displayHeight),
              KeyPad()
            ],
          ),
        ),
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            onTap: (index) {
              switch (index) {
                case 0:
                  homePresenter.page = 0;
                  setState(() {});
                  break;
                case 1:
                  homePresenter.page = 1;
                  setState(() {});
                  break;
                case 2:
                  homePresenter.page = 2;
                  setState(() {});
                  break;
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: homePresenter.page == 0 ? Color(0xff8382AF) : Colors.grey,
                ),
                title: new Text(
                  'Home',
                  style: TextStyle(
                      color: homePresenter.page == 0 ? Color(0xff8382AF) : Colors.grey),
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    color: homePresenter.page == 1 ? Color(0xff8382AF) : Colors.grey,
                  ),
                  title: Text(
                    'Riwayat',
                    style: TextStyle(
                        color: homePresenter.page == 1 ? Color(0xff8382AF) : Colors.grey),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: homePresenter.page == 2 ? Color(0xff8382AF) : Colors.grey,
                  ),
                  title: Text(
                    'Akun',
                    style: TextStyle(
                        color: homePresenter.page == 2 ? Color(0xff8382AF) : Colors.grey),
                  )),
            ]),
      ),
    );
  }
}