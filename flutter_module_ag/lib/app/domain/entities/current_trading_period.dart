import 'package:flutter_module_ag/app/domain/entities/pre.dart';

class CurrentTradingPeriod {
  Pre? pre;
  Pre? regular;
  Pre? post;

  CurrentTradingPeriod({this.pre, this.regular, this.post});

  CurrentTradingPeriod.fromJson(Map<String, dynamic> json) {
    pre = json['pre'] != null ? new Pre.fromJson(json['pre']) : null;
    regular =
        json['regular'] != null ? new Pre.fromJson(json['regular']) : null;
    post = json['post'] != null ? new Pre.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pre != null) {
      data['pre'] = this.pre!.toJson();
    }
    if (this.regular != null) {
      data['regular'] = this.regular!.toJson();
    }
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}
