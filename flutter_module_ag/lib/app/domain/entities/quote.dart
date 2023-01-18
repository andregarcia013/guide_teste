class Quote {
  List<double>? low;
  List<double>? open;
  List<double>? close;
  List<double>? high;
  List<int>? volume;

  Quote({this.low, this.open, this.close, this.high, this.volume});

  Quote.fromJson(Map<String, dynamic> json) {
    low = json['low'].cast<double>();
    open = json['open'].cast<double>();
    close = json['close'].cast<double>();
    high = json['high'].cast<double>();
    volume = json['volume'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['low'] = this.low;
    data['open'] = this.open;
    data['close'] = this.close;
    data['high'] = this.high;
    data['volume'] = this.volume;
    return data;
  }
}
