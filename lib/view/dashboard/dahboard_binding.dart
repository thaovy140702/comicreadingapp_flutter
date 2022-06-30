
import 'package:comicreadingapp/controller/dashboard_controller.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DashboardController());
    Get.put(HomeController());
  }

}