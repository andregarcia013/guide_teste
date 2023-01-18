class Pre {
  String? timezone;
  int? start;
  int? end;
  int? gmtoffset;

  Pre({this.timezone, this.start, this.end, this.gmtoffset});

  Pre.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    start = json['start'];
    end = json['end'];
    gmtoffset = json['gmtoffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timezone'] = this.timezone;
    data['start'] = this.start;
    data['end'] = this.end;
    data['gmtoffset'] = this.gmtoffset;
    return data;
  }
}
