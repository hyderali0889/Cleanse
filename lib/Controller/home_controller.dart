import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool initialCleaning = true.obs;
  RxBool upworkCleaning = false.obs;

  changeInitial() {
    initialCleaning.value = !initialCleaning.value;
    upworkCleaning.value = false;
  }

  changeUpwork() {
    upworkCleaning.value = !upworkCleaning.value;
    initialCleaning.value = false;
  }
}
