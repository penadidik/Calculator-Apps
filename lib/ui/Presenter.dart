
import 'package:calculator_apps/network/model/RiwayatModel.dart';
import 'package:calculator_apps/util/Preferences.dart';
import 'package:flutter/cupertino.dart';

import 'home/calculator/CalculatorModel.dart';
import 'home/calculator/CalculatorViewModel.dart';

class Presenter extends ChangeNotifier {

  String output;
  int page = 0;
  RiwayatModel riwayatModel = new RiwayatModel();

  void start(State state){
    KeyController.listen((event) => CalculatorViewModel.process(event));
    CalculatorViewModel.listen((data) => state.setState(() { output = data; }));
    CalculatorViewModel.refresh();
    notifyListeners();
  }

  void saveRiwayat(int type, String data){
    switch(type){
      case 0:
        riwayatModel.firstNumber = data;
        break;
      case 1:
        riwayatModel.operator = data;
        break;
      case 2:
        riwayatModel.secondNumber = data;
        break;
      case 3:
        riwayatModel.result = data;
        Preferences.setRiwayat(riwayatModel);
        notifyListeners();
        break;
    }
  }
}