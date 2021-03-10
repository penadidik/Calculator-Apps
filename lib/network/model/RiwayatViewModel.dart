
import 'package:calculator_apps/network/model/RiwayatModel.dart';

class RiwayatViewModel {

  final RiwayatModel riwayatModel;

  RiwayatViewModel({this.riwayatModel});

  String get firstNumber{
    return this.firstNumber;
  }

  String get secondNumber{
    return this.secondNumber;
  }

  String get result{
    return this.result;
  }
}