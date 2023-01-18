import 'package:flutter_module_ag/app/domain/entities/chart.dart';

class ChartDataTable {
  List<Chart>? data;
  double maxPrice = 0;

  ChartDataTable({this.data, required this.maxPrice});
}
