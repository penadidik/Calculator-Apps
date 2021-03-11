//created by https://github.com/penadidik on March 7th 2021
import 'package:calculator_apps/network/AppServices.dart';
import 'package:calculator_apps/network/model/HistoryModel.dart';
import 'package:calculator_apps/util/Preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:toast/toast.dart';

import 'model/BaseResponseModel.dart';

class RemoteData{
  static const todoTable = 'riwayat';
  static const id = 'id';
  static const firstNumber = 'firstNumber';
  static const operator = 'operator';
  static const secondNumber = 'secondNumber';
  static const result = 'result';
  AppServices dbHelper = new AppServices();

  Future<int> addHistory(HistoryModel historyModel) async {
    Database db = await dbHelper.sqLiteDb();
    final sql = '''INSERT INTO ${RemoteData.todoTable}
    (
      ${RemoteData.firstNumber},
      ${RemoteData.operator},
      ${RemoteData.secondNumber},
      ${RemoteData.result}
    )
    VALUES (?,?)''';
    List<dynamic> params = [historyModel.firstNumber, historyModel.operator, historyModel.secondNumber, historyModel.result];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<List<HistoryModel>> getHistoryList() async {
    Database db = await dbHelper.sqLiteDb();
    final sql = '''SELECT * FROM ${RemoteData.todoTable}''';
    final data = await db.rawQuery(sql);
    List<HistoryModel> historyList = List();
    for (final node in data) {
      final riwayat = HistoryModel.fromMap(node);
      historyList.add(riwayat);
    }
    return historyList;
  }

  Future<int> deleteHistory(HistoryModel historyModel) async {
    Database db = await dbHelper.sqLiteDb();
    final sql = '''DELETE FROM ${RemoteData.todoTable}
    WHERE ${RemoteData.id} = ?
    ''';
    List<dynamic> params = [historyModel.id];
    final result = await db.rawDelete(sql, params);
    return result;
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