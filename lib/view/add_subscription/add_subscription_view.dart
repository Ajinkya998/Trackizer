import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tackizer/common/color_extension.dart';
import 'package:tackizer/common/widgets/buttons/image_button.dart';
import 'package:tackizer/common/widgets/buttons/primary_button.dart';
import 'package:tackizer/common/widgets/textfield/round_textfield.dart';

class AddSubscriptionView extends StatefulWidget {
  const AddSubscriptionView({super.key});

  @override
  State<AddSubscriptionView> createState() => _AddSubscriptionViewState();
}

class _AddSubscriptionViewState extends State<AddSubscriptionView> {
  double amountVal = 0.09;
  final TextEditingController descriptionController = TextEditingController();
  List subscriptionList = [
    {"name": "HBO GO", "icon": "assets/images/hbo_logo.png", "price": "5.99"},
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
              decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Image.asset(
                                "assets/images/back.png",
                                width: 25,
                                height: 25,
                                color: TColor.gray30,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New",
                              style:
                                  TextStyle(fontSize: 16, color: TColor.gray30),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Add new\n Subscription",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: TColor.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.6,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.65,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                        itemCount: subscriptionList.length,
                        itemBuilder: (context, index, _) {
                          var sObj = subscriptionList[index] as Map? ?? {};
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(sObj["icon"],
                                    width: media.width * 0.4,
                                    height: media.width * 0.4,
                                    fit: BoxFit.fitHeight),
                                const Spacer(),
                                Text(
                                  sObj["name"],
                                  style: TextStyle(
                                      color: TColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                child: RoundTextfield(
                    title: "Description",
                    controller: descriptionController,
                    titleAlign: TextAlign.center)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageButton(
                      image: "assets/images/minus.png",
                      onPressed: () {
                        amountVal -= 0.1;
                        if (amountVal < 0) {
                          amountVal = 0;
                        }
                        setState(() {});
                      }),
                  Column(
                    children: [
                      Text(
                        "Monthly Price",
                        style: TextStyle(
                            color: TColor.gray40,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${amountVal.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 1,
                        width: 150,
                        color: TColor.gray70,
                      ),
                    ],
                  ),
                  ImageButton(
                      image: "assets/images/plus.png",
                      onPressed: () {
                        amountVal += 0.1;
                        setState(() {});
                      }),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(title: "Add this platform", onTap: () {})),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
