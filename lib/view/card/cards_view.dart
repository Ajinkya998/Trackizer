import 'package:card_swiper/card_swiper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tackizer/common/color_extension.dart';
import 'package:tackizer/view/settings/settings_view.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  SwiperController swiperController = SwiperController();

  List cardList = [
    {"name": "Ajinkya", "number": "2197", "date": "08/27"},
    {"name": "Priyanka", "number": "5641", "date": "03/25"},
    {"name": "Poonam", "number": "2847", "date": "05/29"},
    {"name": "Suresh", "number": "8495", "date": "07/26"},
  ];
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

  Widget buildSwiper() {
    return Swiper(
      itemCount: cardList.length,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
        ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
        ..addTranslate([
          const Offset(-370.0, -40.0),
          Offset.zero,
          const Offset(370.0, -40.0)
        ]),
      fade: 1.0,
      scale: 0.8,
      itemWidth: 232.0,
      itemHeight: 350,
      controller: swiperController,
      layout: SwiperLayout.STACK,
      viewportFraction: 0.8,
      axisDirection: AxisDirection.right,
      autoplayDisableOnInteraction: false,
      itemBuilder: (context, index) {
        final cObj = cardList[index] as Map? ?? {};
        return Container(
          decoration: BoxDecoration(
            color: TColor.gray70,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 4),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset("assets/images/card_blank.png",
                  width: 232, height: 350),
              Column(
                children: [
                  const SizedBox(height: 30),
                  Image.asset("assets/images/mastercard_logo.png", width: 50),
                  const SizedBox(height: 8),
                  Text(
                    "Virtual Cards",
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 110),
                  Text(
                    cObj["name"],
                    style: TextStyle(
                        color: TColor.gray20,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "**** **** **** ${cObj["number"]}",
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cObj["date"],
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              width: double.infinity,
              height: 600,
              child: buildSwiper(),
            ),
            Column(
              children: [
                SafeArea(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Credit Cards",
                            style:
                                TextStyle(color: TColor.gray30, fontSize: 16),
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
                ),
                const SizedBox(height: 410),
                Text(
                  "Subscriptions",
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: subscriptionList.map((sObj) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      child: Image.asset(sObj["icon"], width: 40, height: 40),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 35),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: TColor.gray70.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {},
                          child: DottedBorder(
                            dashPattern: const [5, 4],
                            strokeWidth: 1,
                            radius: const Radius.circular(16),
                            color: TColor.border.withOpacity(0.1),
                            borderType: BorderType.RRect,
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add new card ",
                                    style: TextStyle(
                                        color: TColor.gray30,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Image.asset("assets/images/add.png",
                                      width: 12,
                                      height: 12,
                                      color: TColor.gray30)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
