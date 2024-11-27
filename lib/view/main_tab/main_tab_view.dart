import 'package:flutter/material.dart';
import 'package:tackizer/view/add_subscription/add_subscription_view.dart';
import 'package:tackizer/view/calendar/calendar_view.dart';
import 'package:tackizer/view/card/cards_view.dart';
import 'package:tackizer/view/spending_budgets/spending_budgets_view.dart';

import '../../common/color_extension.dart';
import '../home/home_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Stack(
            children: [
              PageStorage(bucket: pageStorageBucket, child: currentTabView),
              SafeArea(
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/images/bottom_bar_bg.png"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectTab = 0;
                                    currentTabView = const HomeView();
                                  });
                                },
                                icon: Image.asset("assets/images/home.png",
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 0
                                        ? TColor.white
                                        : TColor.gray30),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectTab = 1;
                                    currentTabView =
                                        const SpendingBudgetsView();
                                  });
                                },
                                icon: Image.asset("assets/images/budgets.png",
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 1
                                        ? TColor.white
                                        : TColor.gray30),
                              ),
                              const SizedBox(height: 50, width: 50),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectTab = 2;
                                    currentTabView = const CalendarView();
                                  });
                                },
                                icon: Image.asset("assets/images/calendar.png",
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 2
                                        ? TColor.white
                                        : TColor.gray30),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selectTab = 3;
                                    currentTabView = const CardsView();
                                  });
                                },
                                icon: Image.asset(
                                    "assets/images/creditcards.png",
                                    width: 20,
                                    height: 20,
                                    color: selectTab == 3
                                        ? TColor.white
                                        : TColor.gray30),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddSubscriptionView()));
            },
            child: Container(
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: TColor.secondary.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset("assets/images/center_btn.png",
                  width: 50, height: 50),
            ),
          ),
        ],
      ),
    );
  }
}
