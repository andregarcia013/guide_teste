import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module_ag/app/domain/entities/chart_data_table.dart';
import 'package:flutter_module_ag/app/infrastructure/theme/theme.dart';
import 'package:flutter_module_ag/app/presentation/components/base_layout.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
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
          items: controller.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: (controller.dataTableData.value.data!.length) * 50.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Dia',
                        style: MainTheme.headingRowStyle,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Data',
                        style: MainTheme.headingRowStyle,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Valor',
                        style: MainTheme.headingRowStyle,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Variação em relaçào ao dia anterior',
                        style: MainTheme.headingRowStyle,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Variação em relação a primeira data',
                        style: MainTheme.headingRowStyle,
                      ),
                    ),
                  ),
                ],
                rows: controller.dataTableData.value.data!
                    .map(
                      (e) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(
                            e.day as String,
                            style: MainTheme.rowStyle,
                          )),
                          DataCell(Text(
                            e.date as String,
                            style: MainTheme.rowStyle,
                          )),
                          DataCell(Text(e.price as String,
                              style: MainTheme.rowStyle)),
                          DataCell(Text(
                            e.lastDayVariation as String,
                            style: MainTheme.rowStyle,
                          )),
                          DataCell(Text(e.firstDayVariation as String,
                              style: MainTheme.rowStyle)),
                        ],
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        )
      ]),
    );
  }
}
