import 'package:flutter_module_ag/app/domain/entities/quote.dart';

class Indicators {
  List<Quote>? quote;

  Indicators({this.quote});

  Indicators.fromJson(Map<String, dynamic> json) {
    if (json['quote'] != null) {
      quote = <Quote>[];
      json['quote'].forEach((v) {
        quote!.add(new Quote.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quote != null) {
      data['quote'] = this.quote!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
