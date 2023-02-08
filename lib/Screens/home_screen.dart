import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:house_cleaning/Controller/home_controller.dart';
import 'package:house_cleaning/utils/main_colors.dart';

import '../utils/font_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeController controller = Get.find<HomeController>();

    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.1,
              child: Center(
                child: Text(
                  "Your Plan",
                  style: context.textTheme.bodyMedium!
                      .copyWith(fontFamily: FontNames().monst['semiBold']),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: MainColors().textWhite,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14.0),
                        topRight: Radius.circular(14.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 8.0, top: 20),
                      child: Text(
                        "Selected Cleaning",
                        style: context.textTheme.labelLarge!.copyWith(
                            fontSize: 16, fontFamily: FontNames().ubu["bold"]),
                      ),
                    ),
                    SelectCleaning(controller: controller),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 8.0, top: 20),
                      child: Text(
                        "Selected Frequency",
                        style: context.textTheme.labelLarge!.copyWith(
                            fontSize: 16, fontFamily: FontNames().ubu["bold"]),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class SelectCleaning extends StatelessWidget {
  const SelectCleaning({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 140,
                height: 120,
                decoration: BoxDecoration(
                    color: MainColors().imgBackground,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/icons/1.png"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Initial Cleaning",
                  style: context.textTheme.labelSmall!
                      .copyWith(fontFamily: FontNames().monst["semiBold"]),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: InkWell(
                    onTap: () {
                      controller.changeInitial();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: MainColors().buttonPink, width: 2),
                          color: controller.initialCleaning.value
                              ? MainColors().buttonPink
                              : Colors.transparent),
                      child: controller.initialCleaning.value
                          ? FaIcon(
                              FontAwesomeIcons.lightCheck,
                              color: MainColors().textWhite,
                              size: 10,
                            )
                          : Container(),
                    ),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 140,
                height: 120,
                decoration: BoxDecoration(
                    color: MainColors().imgBackground,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/icons/2.png"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Upkeep Cleaning",
                  style: context.textTheme.labelSmall!
                      .copyWith(fontFamily: FontNames().monst["semiBold"]),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: InkWell(
                    onTap: () {
                      controller.changeUpwork();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: MainColors().buttonPink, width: 2),
                          color: controller.upworkCleaning.value
                              ? MainColors().buttonPink
                              : Colors.transparent),
                      child: controller.upworkCleaning.value
                          ? FaIcon(
                              FontAwesomeIcons.lightCheck,
                              color: MainColors().textWhite,
                              size: 10,
                            )
                          : Container(),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
