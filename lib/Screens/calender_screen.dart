import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:house_cleaning/utils/main_colors.dart';

import '../utils/font_names.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CalendarWeekController weekController = CalendarWeekController();

    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
                height: size.height * 0.3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "Cleanse Calendar",
                        style: context.textTheme.bodyMedium!.copyWith(
                            fontFamily: FontNames().monst['semiBold']),
                      ),
                    ),
                    CalendarWeek(
                      dayOfWeekStyle: TextStyle(
                          color: MainColors().textWhite, fontSize: 12),
                      pressedDateStyle: TextStyle(
                          color: MainColors().textWhite, fontSize: 12),
                      marginMonth: const EdgeInsets.only(bottom: 15),
                      pressedDateBackgroundColor: MainColors().buttonPink,
                      weekendsStyle: TextStyle(
                          color: MainColors().textWhite, fontSize: 12),
                      dateStyle: TextStyle(
                          color: MainColors().textWhite, fontSize: 12),
                      height: 120,
                      controller: weekController,
                      onDatePressed: (DateTime date) {
                        print(date.day);
                      },
                      minDate: DateTime.now().add(
                        const Duration(days: -365),
                      ),
                      maxDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                )),
            Expanded(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: MainColors().textWhite,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14.0),
                        topRight: Radius.circular(14.0))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          MainCard(size: size),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: MainCard(size: size),
                          ),
                          MainCard(size: size),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            "10 pm",
            style: context.textTheme.labelSmall!
                .copyWith(fontFamily: FontNames().monst["semiBold"]),
          ),
        ),
        Container(
          color: MainColors().imgBackground,
          width: size.width * 0.7,
          height: size.height * 0.25,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Name",
                  style: context.textTheme.headlineSmall!
                      .copyWith(fontFamily: FontNames().monst["bold"]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text("Cleaning Type",
                      style: context.textTheme.labelSmall),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidClock,
                        color: MainColors().backgroundPurple,
                        size: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text("10 pm to 12 pm",
                            style: context.textTheme.headlineSmall!.copyWith(
                                fontSize: 12,
                                fontFamily: FontNames().monst["bold"])),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text("Client Rating",
                            style: context.textTheme.labelSmall!.copyWith(
                                fontSize: 12,
                                fontFamily: FontNames().monst["light"])),
                      ),
                      SizedBox(
                        width: size.width * 0.2,
                        height: size.height * 0.02,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: MainColors().mainBlack,
                              size: 11,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: MainColors().borderBlack,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            child: FaIcon(
                          FontAwesomeIcons.lightPhone,
                          size: 12,
                          color: MainColors().backgroundPurple,
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: InkWell(
                              child: FaIcon(
                            FontAwesomeIcons.lightMailbox,
                            size: 12,
                            color: MainColors().backgroundPurple,
                          )),
                        ),
                      ],
                    ),
                    Text("\$ 50",
                        style: context.textTheme.headlineSmall!.copyWith(
                            fontSize: 12,
                            fontFamily: FontNames().monst["semiBold"])),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
