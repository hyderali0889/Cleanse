import 'package:get/get.dart';
import 'package:house_cleaning/Screens/home_screen.dart';
import 'package:house_cleaning/Screens/info_screen.dart';
import 'package:house_cleaning/Screens/splash_screen.dart';
import 'package:house_cleaning/Screens/swipe_pages.dart';

import '../Bindings/home_binding.dart';
import '../Bindings/swipe_binding.dart';
import 'page_routes.dart';

class AppRoutes {
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: PageRoutes().splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(name: PageRoutes().homeScreen, page: () => const HomeScreen() , binding: HomeBinding()),
    GetPage(name: PageRoutes().swipeScreen, page: () => const SwipeScreen() , binding: SwipeBindings()),
    GetPage(name: PageRoutes().infoScreen, page: () => const InfoScreen()),
  ];
}
