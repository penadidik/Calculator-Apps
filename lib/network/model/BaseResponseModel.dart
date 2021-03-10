//created by https://github.com/penadidik on March 7th 2021
class BaseResponseModel{
  int status;
  String message;
  String data;

  BaseResponseModel({this.status, this.message, this.data});

  BaseResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }

}