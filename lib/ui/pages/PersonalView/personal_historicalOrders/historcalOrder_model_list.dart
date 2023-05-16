import 'package:json_annotation/json_annotation.dart';
import 'historcalOrderModel.dart';


@JsonSerializable()

class HistorcalOrder_model_list {
  int? code;
  String? message;
  List<HistorcalOrderModel>? data;

  HistorcalOrder_model_list({this.code, this.message, this.data});

  HistorcalOrder_model_list.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HistorcalOrderModel>[];
      json['data'].forEach((v) {
        data!.add(new HistorcalOrderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

