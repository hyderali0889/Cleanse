import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/main_colors.dart';
import 'about_screen.dart';
import 'calender_screen.dart';
import 'home_screen.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      removeDialog();
    });
  }

  void removeDialog() async {
    showNewDialog();
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 1);

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        scrollBehavior: AppScrollBehavior(),
        controller: controller,
        children: const [AboutScreen(), HomeScreen(), CalenderScreen()],
      ),
    );
  }

  showNewDialog() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              alignment: Alignment.center,
              width: 400,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Swipe to Switch Screens. Long press to remove extras",
                  style: TextStyle(
                      color: MainColors().backgroundPurple, fontSize: 20),
                ),
              ),
            ),
          );
        });
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
