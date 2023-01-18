import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_module_ag/app/infrastructure/navigation/navigation.dart';
import 'package:flutter_module_ag/app/infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
