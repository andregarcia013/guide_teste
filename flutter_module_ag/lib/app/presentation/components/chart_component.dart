import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_ag/app/domain/entities/chart.dart';
import 'package:flutter_module_ag/app/domain/entities/chart_data.dart';
import 'package:flutter_module_ag/app/domain/entities/chart_data_table.dart';
import 'package:flutter_module_ag/app/infrastructure/theme/theme.dart';

class ChartComponent extends StatelessWidget {
  final gradientColors = [
    MainTheme.primaryColor,
    MainTheme.secodaryColor,
  ];
  ChartDataTable chartData;
  ChartComponent({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 500,
      width: MediaQuery.of(context).size.width * 5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        color: Color(0xff232d37),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 12,
          top: 24,
          bottom: 12,
        ),
        child: LineChart(
          mainData(),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;

    String date = chartData.data?[value.round() - 1].date as String;
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(date.substring(0, date.length - 5), style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;

    if (value % 5 != 0) {
      return Container();
    }

    return Text('${value}', style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 1,
      maxX: 30,
      minY: 0,
      maxY: chartData.maxPrice + 5,
      lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: MainTheme.secodaryColor,
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final flSpot = barSpot;
                if (flSpot.x == 0 || flSpot.x == 6) {
                  return null;
                }

                TextAlign textAlign;
                switch (flSpot.x.toInt()) {
                  case 1:
                    textAlign = TextAlign.left;
                    break;
                  case 5:
                    textAlign = TextAlign.right;
                    break;
                  default:
                    textAlign = TextAlign.center;
                }

                return LineTooltipItem(
                  barSpot.y.toStringAsFixed(2),
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [],
                  textAlign: textAlign,
                );
              }).toList();
            },
          )),
      lineBarsData: [
        LineChartBarData(
          spots: chartData.data!
              .map(
                (e) => FlSpot(
                    double.parse(e.day as String), e.priceData as double),
              )
              .toList(),
          isCurved: true,
          color: MainTheme.primaryColor,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
