import 'package:flutter_module_ag/app/config.dart';
import 'package:flutter_module_ag/app/domain/core/interfaces/usecases.dart';
import 'package:flutter_module_ag/app/domain/entities/chart.dart';
import 'package:flutter_module_ag/app/domain/entities/chart_data.dart';
import 'package:flutter_module_ag/app/domain/entities/chart_data_table.dart';
import 'package:flutter_module_ag/app/infrastructure/dal/daos/chart_dao.dart';

class GetChartData implements UseCases {
  ChartDAO provider = ChartDAO();
  String chartName;

  GetChartData(this.chartName);

  @override
  Future<ChartDataTable> handle() async {
    ChartData chartData = await provider.getChartData(chartName) as ChartData;
    ChartDataTable chartDataTable = ChartDataTable(data: [], maxPrice: 0);
    
    chartData.result![0].timestamp!.asMap().forEach((index, element) {
      double price = chartData.result![0].indicators!.quote![0].open![index];
      double lastDayPrice = index == 0
          ? 0
          : (chartData.result![0].indicators!.quote![0].open![index - 1]);

      double lastDayVariation =
          index == 0 ? 0 : (((lastDayPrice - price) / lastDayPrice) * 100);

      double firstDayPrice =
          (chartData.result![0].indicators!.quote![0].open![0]);
      double firstDayVariation =
          index == 0 ? 0 : (((firstDayPrice - price) / firstDayPrice) * 100);
      Chart chart = Chart(
          day: (index + 1).toString(),
          date: f.format(DateTime.fromMillisecondsSinceEpoch(element * 1000)),
          price: "R\$${price.toStringAsFixed(2)}",
          priceData: price,
          lastDayVariation: "${lastDayVariation.toStringAsFixed(2)}%",
          firstDayVariation: "${firstDayVariation.toStringAsFixed(2)}%");
      chartDataTable.maxPrice = price >  chartDataTable.maxPrice ? price : chartDataTable.maxPrice;    
      chartDataTable.data!.add(chart);
    });

    return chartDataTable;
  }
}
