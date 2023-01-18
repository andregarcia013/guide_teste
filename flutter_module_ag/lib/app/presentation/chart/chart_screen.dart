import 'package:flutter/material.dart';
import 'package:flutter_module_ag/app/infrastructure/theme/theme.dart';
import 'package:flutter_module_ag/app/presentation/components/base_layout.dart';
import 'package:flutter_module_ag/app/presentation/components/chart_component.dart';

import 'package:get/get.dart';

import 'controllers/chart_controller.dart';

class ChartView extends GetView<ChartController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartController>(
        builder: (controller) => BaseLayout(children: [
              DropdownButton<String>(
                dropdownColor: MainTheme.secodaryColor,
                value: controller.selectedValue.value,
                elevation: 16,
                style: const TextStyle(color: Colors.white),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String? value) {
                  controller.setSelectedValue(value as String);
                },
                items: controller.list
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    ChartComponent(chartData: controller.dataTableData.value),
                  ])),
            ]));
  }
}
