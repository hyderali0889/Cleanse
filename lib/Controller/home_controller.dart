import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool initialCleaning = true.obs;
  RxBool upworkCleaning = false.obs;
  RxString selectedFreq = "Weekly".obs;

  selectFreq(String str) {
    selectedFreq.value = str;
  }

  changeInitial() {
    initialCleaning.value = true;
    upworkCleaning.value = false;
  }

  changeUpwork() {
    upworkCleaning.value = true;
    initialCleaning.value = false;
  }
}
