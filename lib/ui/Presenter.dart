import 'package:flutter/cupertino.dart';

import 'home/calculator/CalculatorModel.dart';
import 'home/calculator/CalculatorViewModel.dart';

class Presenter extends ChangeNotifier {

  String output;
  int page = 0;

  void start(State state){
    KeyController.listen((event) => CalculatorViewModel.process(event));
    CalculatorViewModel.listen((data) => state.setState(() { output = data; }));
    CalculatorViewModel.refresh();
    notifyListeners();
  }

  void saveRiwayat(int type, String data){

  }
}