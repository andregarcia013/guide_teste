import 'package:flutter_module_ag/app/domain/entities/chart_data_table.dart';
import 'package:flutter_module_ag/app/domain/usecases/get_chart_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> list = <String>['PETR4.SA', 'API'];

  Rx<ChartDataTable> dataTableData = ChartDataTable(data: [], maxPrice: 0).obs;
  RxString selectedValue = "PETR4.SA".obs;
  void getChart(String stock) {
    GetChartData(stock).handle().then((value) {
      dataTableData = value.obs;
      update();
    });
  }

  void setSelectedValue(String value) {
    selectedValue = value.obs;
    getChart(value);
    update();
  }

  @override
  void onReady() {
    super.onReady();
    getChart(selectedValue.value);
  }

  @override
  void onClose() {}
}
