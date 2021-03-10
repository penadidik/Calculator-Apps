//created by https://github.com/penadidik on March 7th 2021
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

import 'model/BaseResponseModel.dart';

class RemoteData{
  Map request = new Map<String, dynamic>();
  Map result = new Map();

  Future<Map> getData(BuildContext context, String keyword, String page, String pageSize, String idCategories, String sortBy, String orderBy) async {

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