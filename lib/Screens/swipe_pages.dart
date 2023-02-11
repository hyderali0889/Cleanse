import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Controller/page_controller.dart';
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
  bool showbott = true;
  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showNewDialog();
      removeWidget();
    });

    removeDialog();
  }

  void removeDialog() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.back();
  }

  removeWidget() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      showbott = false;
    });
  }

  addAndRemoveWidget() async {
    setState(() {
      showbott = true;
    });
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      showbott = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget initWidget = Positioned(
      bottom: 0,
      left: size.width * 0.5,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: showbott ? 1 : 0,
        child: AnimatedPadding(
          duration: const Duration(seconds: 1),
          padding: EdgeInsets.only(bottom: !showbott ? 0 : 20.0),
          child: Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: MainColors().backgroundPurple),
            child: FaIcon(
              Get.find<PageNumController>().page.value == 0
                  ? FontAwesomeIcons.lightCogs
                  : Get.find<PageNumController>().page.value == 1
                      ? FontAwesomeIcons.lightHome
                      : FontAwesomeIcons.lightCalendar,
              color: MainColors().textWhite,
              size: 20,
            ),
          ),
        ),
      ),
    );

    final controller = PageController(initialPage: 1);
    PageNumController pageNumController = Get.find<PageNumController>();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            scrollBehavior: AppScrollBehavior(),
            onPageChanged: (number) {
              pageNumController.changePageNumber(number);
              addAndRemoveWidget();
            },
            controller: controller,
            children: const [AboutScreen(), HomeScreen(), CalenderScreen()],
          ),
          initWidget
        ],
      ),
    );
  }

  showNewDialog() {
    return showDialog(
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
