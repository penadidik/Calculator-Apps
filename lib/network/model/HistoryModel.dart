//created by https://github.com/penadidik on March 7th 2021
class HistoryModel{
  int id;
  String firstNumber;
  String operator;
  String secondNumber;
  String result;

  HistoryModel({this.id, this.firstNumber, this.operator, this.secondNumber, this.result});

  HistoryModel.fromMap(Map<String, dynamic> map){
    id = map['id'];
    firstNumber = map['firstNumber'];
    operator = map['operator'];
    secondNumber = map['secondNumber'];
    result = map['result'];
  }

  int get _id => id;
  String get _firstNumber => firstNumber;
  String get _operator => operator;
  String get _secondNumber => secondNumber;
  String get _result => result;

  set _id(int value){
    id = value;
  }

  set _firstNumber(String value){
    firstNumber = value;
  }

  set _operator(String value){
    operator = value;
  }

  set _secondNumber(String value) {
    secondNumber = value;
  }

  set _result(String value){
    result = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map['id'] = this.id;
    map['firstNumber'] = this._firstNumber;
    map['operator'] = this._operator;
    map['secondNumber'] = this._secondNumber;
    map['result'] = this._result;

    return map;
  }
}