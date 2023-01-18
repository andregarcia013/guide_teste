import 'package:flutter_module_ag/app/domain/entities/indicators.dart';
import 'package:flutter_module_ag/app/domain/entities/meta.dart';

class Result {
  Meta? meta;
  List<int>? timestamp;
  Indicators? indicators;

  Result({this.meta, this.timestamp, this.indicators});

  Result.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    timestamp = json['timestamp'].cast<int>();
    indicators = json['indicators'] != null
        ? new Indicators.fromJson(json['indicators'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['timestamp'] = this.timestamp;
    if (this.indicators != null) {
      data['indicators'] = this.indicators!.toJson();
    }
    return data;
  }
}
