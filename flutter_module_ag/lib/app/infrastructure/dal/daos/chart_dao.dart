import 'package:flutter_module_ag/app/domain/core/interfaces/chart_dao_interface.dart';
import 'package:flutter_module_ag/app/domain/entities/chart_data.dart';
import 'package:flutter_module_ag/app/infrastructure/dal/services/http_service.dart';
import 'package:get/get.dart';

class ChartDAO extends HttpService implements ChartDAOInterface {
  @override
  Future<ChartData?> getChartData(String chartName) async {
    Response response =
        (await get(chartName, query: {'interval': '1d', 'range': '30d'}));

    return ChartData.fromJson(response.body['chart']);
  }
}
