import 'package:flutter/material.dart';
import 'package:tackizer/common/color_extension.dart';
import 'package:tackizer/common/widgets/buttons/segment_button.dart';
import 'package:tackizer/common/widgets/buttons/status_button.dart';
import 'package:tackizer/common/widgets/custom_arc/custom_arc_painter.dart';
import 'package:tackizer/common/widgets/tile/subscription_home_tile.dart';
import 'package:tackizer/common/widgets/tile/upcoming_home_tile.dart';
import 'package:tackizer/view/subscription_info/subscription_info_view.dart';

import '../settings/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;
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
  Widget build(BuildContext context) {
    Size media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/images/home_bg.png"),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: media.width * 0.72,
                        height: media.width * 0.72,
                        padding: EdgeInsets.only(bottom: media.width * 0.05),
                        child: CustomPaint(painter: CustomArcPainter(end: 220)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
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
                                  "assets/images/settings.png"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: media.width * 0.05),
                      Image.asset("assets/images/app_logo.png",
                          width: media.width * 0.25, fit: BoxFit.contain),
                      SizedBox(height: media.width * 0.02),
                      Text("\$1,235",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: TColor.white)),
                      SizedBox(height: media.width * 0.02),
                      Text("This month bills",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: TColor.gray40)),
                      SizedBox(height: media.width * 0.03),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: TColor.gray60.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: TColor.border.withOpacity(0.2),
                            ),
                          ),
                          child: Text("See your Budget",
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                  title: "Active Subs",
                                  value: "12",
                                  onPressed: () {},
                                  statusColor: TColor.secondary),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: StatusButton(
                                  title: "Highest Subs",
                                  value: "\$19.99",
                                  onPressed: () {},
                                  statusColor: TColor.primary10),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: StatusButton(
                                  title: "Lowest Subs",
                                  value: "\$5.99",
                                  onPressed: () {},
                                  statusColor: TColor.secondaryG),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(8),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SegmentButton(
                      title: "Your Subscription",
                      onPressed: () {
                        setState(() {
                          isSubscription = !isSubscription;
                        });
                      },
                      isActive: isSubscription,
                    ),
                  ),
                  Expanded(
                    child: SegmentButton(
                      title: "Upcoming Bills",
                      onPressed: () {
                        setState(() {
                          isSubscription = !isSubscription;
                        });
                      },
                      isActive: !isSubscription,
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: subscriptionList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                var sObj = subscriptionList[index] as Map? ?? {};
                return isSubscription
                    ? SubscriptionHomeTile(
                        sObj: sObj,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SubscriptionInfoView(sObj: sObj),
                              ));
                        })
                    : UpcomingHomeTile(sObj: sObj, onPressed: () {});
              },
            ),
            const SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
