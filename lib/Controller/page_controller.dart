import 'package:get/get.dart';

class PageNumController extends GetxController {
  RxInt page = 1.obs;

  changePageNumber(int num) {
    page.value = num;
  }
}
