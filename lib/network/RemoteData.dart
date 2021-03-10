//created by https://github.com/penadidik on March 7th 2021
import 'package:calculator_apps/util/Preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'model/BaseResponseModel.dart';

class RemoteData{
  Map request = new Map<String, dynamic>();
  Map result = new Map();
  Preferences preferences = new Preferences();

  void simpanRiwayat(BuildContext context, String firstNumber, String secondNumber, String result, int type) {

  }

  void responseStatusCode(BuildContext context, BaseResponseModel baseResponseModel, bool isShowAlert){
    switch(baseResponseModel.status){
      case 200:
        if(isShowAlert == true) Toast.show(baseResponseModel.message, context);
        break;
      case 201:
        Toast.show(baseResponseModel.message, context);
        break;
      case 401:
        Toast.show(baseResponseModel.message, context);
        break;
      default:
        Toast.show(baseResponseModel.message, context);
        break;
    }
  }

}