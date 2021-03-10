//created by https://github.com/penadidik on March 7th 2021
import 'dart:convert';

import 'package:calculator_apps/util/Constant.dart';
import 'package:http/http.dart';

import 'model/BaseResponseModel.dart';

class AppServices{
  Future<BaseResponseModel> callApi(String api, String method, Map<String, dynamic> request) async {
    Map<String, String> headers = {
      "Content-Type": Constant.CONTENT_TYPE_FORM_URL
    };

    switch(method){
      case Constant.METHOD_NAME_IS_POST :
        Response response = await post(Constant.BASE_URL+api, headers: headers, body: request);
        var result =  convertToResponseModel(response);
        return Future.value(result);
        break;
      case Constant.METHOD_NAME_IS_GET :
        Response response = await get(Constant.BASE_URL+api, headers: headers);
        var result = convertToResponseModel(response);
        return Future.value(result);
        break;
    }
  }

  BaseResponseModel convertToResponseModel(Response response){
    Map item = jsonDecode(response.body);
    int code = 200;
    if (response != null) {
      if (item[Constant.RESPONSE_STATUS] is String){
        code = int.parse(item[Constant.RESPONSE_STATUS]);
      }else if (item[Constant.RESPONSE_STATUS] is int){
        code = item[Constant.RESPONSE_STATUS];
      }

      return BaseResponseModel(status: code, message: item[Constant.RESPONSE_MESSAGE], data: json.encode(item[Constant.RESPONSE_DATA]));
    }else {
      return null;
    }

  }
}