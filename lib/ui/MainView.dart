import 'package:calculator_apps/ui/akun/Akun.dart';
import 'package:calculator_apps/ui/riwayat/Riwayat.dart';
import 'package:calculator_apps/util/Assets.dart';
import 'package:calculator_apps/util/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/Home.dart';

void main() => runApp(MaterialApp(home: MainView()));

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int pos = 0;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsState.backgroundColor,
        automaticallyImplyLeading: false,
        title: Image.asset(Assets.icon_calculator, width: 180,),
        actions: <Widget> [],
      ),
      body: Stack(
        children: [
          _getPageWidget(pos),
        ],
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
                  pos = 0;
                  setState(() {});
                  break;
                case 1:
                  pos = 1;
                  setState(() {});
                  break;
                case 2:
                  pos = 2;
                  setState(() {});
                  break;
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: pos == 0 ? ColorsState.labelColor : Colors.grey,
                ),
                title: new Text(
                  'Home',
                  style: TextStyle(
                      color: pos == 0 ? ColorsState.labelColor : Colors.grey),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  color: pos == 1 ? ColorsState.labelColor : Colors.grey,
                ),
                title: new Text(
                  'Riwayat',
                  style: TextStyle(
                      color: pos == 1 ? ColorsState.labelColor : Colors.grey),
                ),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: pos == 2 ? ColorsState.labelColor : Colors.grey,
                  ),
                  title: Text(
                    'Akun',
                    style: TextStyle(
                        color: pos == 2 ? ColorsState.labelColor : Colors.grey),
                  )),
            ]),
      ),
    );
  }

  Widget _getPageWidget(int pos) {
    switch (pos) {
      case 0:
        return Home();
      case 1:
        return Akun();
      case 2:
        return Riwayat();
      default:
        return Container(
          child: Center(
            child: Text(''),
          ),
        );
    }
  }
}