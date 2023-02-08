import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_cleaning/utils/theme_data.dart';
import 'Routes/app_routes.dart';
import 'Routes/page_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cleanse',
      theme: MainAppTheme().mainTheme,
      getPages: AppRoutes.routes,
      initialRoute: PageRoutes().splashScreen,
    );
  }
}
