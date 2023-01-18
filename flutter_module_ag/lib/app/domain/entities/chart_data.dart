import 'package:flutter_module_ag/app/domain/entities/result.dart';

class ChartData {
  List<Result>? result;

  ChartData({this.result});

  ChartData.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      print(json['result']);
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
