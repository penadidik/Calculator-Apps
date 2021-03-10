//created by https://github.com/penadidik on March 7th 2021
class RiwayatModel{
  String firstNumber;
  String operator;
  String secondNumber;
  String result;

  RiwayatModel({this.firstNumber, this.operator, this.secondNumber, this.result});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['firstNumber'] = this.firstNumber;
    data['operator'] = this.operator;
    data['secondNumber'] = this.secondNumber;
    data['result'] = this.result;

    return data;
  }

  RiwayatModel.fromJson(Map<String, dynamic> json){
    firstNumber = json['firstNumber'];
    operator = json['operator'];
    secondNumber = json['secondNumber'];
    result = json['result'];
  }

}