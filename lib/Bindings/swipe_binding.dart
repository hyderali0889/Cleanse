import 'package:get/get.dart';
import 'package:house_cleaning/Controller/page_controller.dart';

class SwipeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PageNumController());
  }
}
