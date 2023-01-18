import 'package:get/get.dart';

import '../../../../presentation/chart/controllers/chart_controller.dart';

class ChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChartController>(
      () => ChartController(),
    );
  }
}
