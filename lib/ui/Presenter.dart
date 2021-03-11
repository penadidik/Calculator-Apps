
import 'package:calculator_apps/network/RemoteData.dart';
import 'package:calculator_apps/network/model/HistoryModel.dart';
import 'package:calculator_apps/ui/akun/Akun.dart';
import 'package:calculator_apps/ui/home/Home.dart';
import 'package:calculator_apps/ui/other/Other.dart';
import 'package:calculator_apps/util/AppRouter.dart';
import 'package:calculator_apps/util/Preferences.dart';
import 'package:flutter/cupertino.dart';

import 'home/calculator/CalculatorAdapter.dart';
import 'home/calculator/CalculatorModel.dart';
import 'home/calculator/CalculatorViewModel.dart';

class Presenter extends ChangeNotifier {

  String output;
  int page = 0;

  HistoryModel historyModel = new HistoryModel();

  void start(State state){
    KeyController.listen((event) => CalculatorViewModel.process(event));
    CalculatorViewModel.listen((data) => state.setState(() { output = data; }));
    CalculatorViewModel.refresh();
    notifyListeners();
  }

  void openPage(int type, BuildContext context){
    switch(type){
      case 0:
        page = 0;
        AppsRouter.makeFirst(context, Home());
        notifyListeners();
        break;
      case 1:
        page = 1;
        AppsRouter.makeFirst(context, Other());
        notifyListeners();
        break;
      case 2:
        page = 2;
        AppsRouter.makeFirst(context, Akun());
        notifyListeners();
        break;
      default:
        page = 0;
        AppsRouter.makeFirst(context, Home());
        notifyListeners();
        break;
    }
  }

  void saveData(dynamic event){
    CalculatorKey key = (event as KeyEvent).key;
    if(key.symbol.type == KeyType.FUNCTION){
      historyModel.result += key.symbol.value;
      RemoteData().addHistory(historyModel);
      notifyListeners();
    }else{
      historyModel.result += key.symbol.value;
    }
  }
}