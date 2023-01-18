import 'package:flutter_module_ag/app/domain/entities/current_trading_period.dart';

class Meta {
  String? currency;
  String? symbol;
  String? exchangeName;
  String? instrumentType;
  int? firstTradeDate;
  int? regularMarketTime;
  int? gmtoffset;
  String? timezone;
  String? exchangeTimezoneName;
  double? regularMarketPrice;
  double? chartPreviousClose;
  double? previousClose;
  int? scale;
  int? priceHint;
  CurrentTradingPeriod? currentTradingPeriod;
  String? dataGranularity;
  String? range;
  List<String>? validRanges;

  Meta(
      {this.currency,
      this.symbol,
      this.exchangeName,
      this.instrumentType,
      this.firstTradeDate,
      this.regularMarketTime,
      this.gmtoffset,
      this.timezone,
      this.exchangeTimezoneName,
      this.regularMarketPrice,
      this.chartPreviousClose,
      this.previousClose,
      this.scale,
      this.priceHint,
      this.currentTradingPeriod,
      this.dataGranularity,
      this.range,
      this.validRanges});

  Meta.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    symbol = json['symbol'];
    exchangeName = json['exchangeName'];
    instrumentType = json['instrumentType'];
    firstTradeDate = json['firstTradeDate'];
    regularMarketTime = json['regularMarketTime'];
    gmtoffset = json['gmtoffset'];
    timezone = json['timezone'];
    exchangeTimezoneName = json['exchangeTimezoneName'];
    regularMarketPrice = json['regularMarketPrice'];
    chartPreviousClose = json['chartPreviousClose'];
    previousClose = json['previousClose'];
    scale = json['scale'];
    priceHint = json['priceHint'];
    currentTradingPeriod = json['currentTradingPeriod'] != null
        ? new CurrentTradingPeriod.fromJson(json['currentTradingPeriod'])
        : null;
    dataGranularity = json['dataGranularity'];
    range = json['range'];
    validRanges = json['validRanges'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['symbol'] = this.symbol;
    data['exchangeName'] = this.exchangeName;
    data['instrumentType'] = this.instrumentType;
    data['firstTradeDate'] = this.firstTradeDate;
    data['regularMarketTime'] = this.regularMarketTime;
    data['gmtoffset'] = this.gmtoffset;
    data['timezone'] = this.timezone;
    data['exchangeTimezoneName'] = this.exchangeTimezoneName;
    data['regularMarketPrice'] = this.regularMarketPrice;
    data['chartPreviousClose'] = this.chartPreviousClose;
    data['previousClose'] = this.previousClose;
    data['scale'] = this.scale;
    data['priceHint'] = this.priceHint;
    if (this.currentTradingPeriod != null) {
      data['currentTradingPeriod'] = this.currentTradingPeriod!.toJson();
    }
    data['dataGranularity'] = this.dataGranularity;
    data['range'] = this.range;
    data['validRanges'] = this.validRanges;
    return data;
  }
}
