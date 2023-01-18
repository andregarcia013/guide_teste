import 'package:flutter_module_ag/app/domain/entities/chart_data.dart';

abstract class ChartDAOInterface {
  Future<ChartData?> getChartData(String chartName);
}
