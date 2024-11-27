import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:tackizer/common/color_extension.dart';
import 'package:tackizer/common/widgets/container/subscription_cell.dart';
import 'package:tackizer/view/settings/settings_view.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  CalendarAgendaController calendarAgendaControllerNotAppBar =
      CalendarAgendaController();

  late DateTime selectedDateNotAppBBar;
  Random random = Random();

  List subscriptionList = [
    {
      "name": "Spotify",
      "icon": "assets/images/spotify_logo.png",
      "price": "5.99"
    },
    {
      "name": "Youtube Premium",
      "icon": "assets/images/youtube_logo.png",
      "price": "18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/images/onedrive_logo.png",
      "price": "29.99"
    },
    {
      "name": "Netflix",
      "icon": "assets/images/netflix_logo.png",
      "price": "15.99"
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Calendar",
                                    style: TextStyle(
                                        color: TColor.gray30, fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SettingsView()));
                                      },
                                      icon: Image.asset(
                                          width: 25,
                                          height: 25,
                                          "assets/images/settings.png")),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Subs\nSchedule",
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3 subscription for today",
                                style: TextStyle(
                                    color: TColor.gray30,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  calendarAgendaControllerNotAppBar
                                      .openCalender();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: TColor.gray60.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: TColor.border.withOpacity(0.2),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "November",
                                        style: TextStyle(
                                            color: TColor.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Icon(Icons.expand_more,
                                          size: 16, color: TColor.white),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          CalendarAgenda(
                            controller: calendarAgendaControllerNotAppBar,
                            backgroundColor: Colors.transparent,
                            fullCalendarBackgroundColor: TColor.gray80,
                            calendarEventColor: TColor.secondary,
                            // fullCalendar: false,
                            locale: 'en',
                            weekDay: WeekDay.short,
                            fullCalendarDay: WeekDay.short,
                            selectedDateColor: TColor.white,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 140)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 4)),
                            events: List.generate(
                                100,
                                (index) => DateTime.now().subtract(
                                    Duration(days: index * random.nextInt(5)))),
                            onDateSelected: (date) {
                              setState(() {
                                selectedDateNotAppBBar = date;
                              });
                            },
                            decoration: BoxDecoration(
                              color: TColor.gray60.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: TColor.border.withOpacity(0.15),
                              ),
                            ),
                            selectDecoration: BoxDecoration(
                              color: TColor.gray60,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: TColor.border.withOpacity(0.15),
                              ),
                            ),
                            eventLogo: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: TColor.secondary,
                              ),
                            ),
                            selectedEventLogo: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: TColor.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("January",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: TColor.white)),
                      Text("\$24.98",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: TColor.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("01.08.2023",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: TColor.gray30)),
                      Text("in upcoming bills",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: TColor.gray30)),
                    ],
                  ),
                ],
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1),
              itemCount: subscriptionList.length,
              itemBuilder: (context, index) {
                var sObj = subscriptionList[index] as Map? ?? {};
                return SubscriptionCell(sObj: sObj, onPressed: () {});
              },
            ),
            const SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
