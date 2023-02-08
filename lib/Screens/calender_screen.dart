import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:house_cleaning/utils/main_colors.dart';

import '../utils/font_names.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  bool showbott = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
              ),
            )
          ],
        ),
      )),
    );
  }
}
