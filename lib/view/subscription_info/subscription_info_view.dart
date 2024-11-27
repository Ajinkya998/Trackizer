import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tackizer/common/widgets/buttons/secondary_button.dart';
import 'package:tackizer/common/widgets/tile/item_tile.dart';

import '../../common/color_extension.dart';

class SubscriptionInfoView extends StatefulWidget {
  final Map sObj;
  const SubscriptionInfoView({super.key, required this.sObj});

  @override
  State<SubscriptionInfoView> createState() => _SubscriptionInfoViewState();
}

class _SubscriptionInfoViewState extends State<SubscriptionInfoView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xff282833).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      height: media.width * 0.9,
                      decoration: BoxDecoration(
                        color: TColor.gray70,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset(
                                  "assets/images/dorp_down.png",
                                  width: 20,
                                  height: 20,
                                  color: TColor.gray30,
                                ),
                              ),
                              Text(
                                "Subscription Info",
                                style: TextStyle(
                                    fontSize: 16, color: TColor.gray30),
                              ),
                              Image.asset(
                                "assets/images/Trash.png",
                                width: 20,
                                height: 20,
                                color: TColor.gray30,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(widget.sObj["icon"],
                              width: media.width * 0.25,
                              height: media.width * 0.25),
                          const SizedBox(height: 20),
                          Text(
                            widget.sObj["name"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColor.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "\$${widget.sObj["price"]}",
                            style: TextStyle(
                                color: TColor.gray30,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: TColor.gray60.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                ItemTile(
                                    title: "Name", value: widget.sObj["name"]),
                                const ItemTile(
                                    title: "Description", value: "Music App"),
                                const ItemTile(
                                    title: "Category", value: "Entertainment"),
                                const ItemTile(
                                    title: "First Payment",
                                    value: "08.07.2023"),
                                const ItemTile(
                                    title: "Reminder", value: "Never"),
                                const ItemTile(
                                    title: "Currency", value: "USD (\$)"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SecondaryButton(title: "Save", onTap: () {})
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 4, right: 4),
                height: media.width * 0.9 + 15,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: TColor.gray),
                    ),
                    Expanded(
                      child: DottedBorder(
                          dashPattern: const [5, 10],
                          padding: EdgeInsets.zero,
                          strokeWidth: 1,
                          radius: const Radius.circular(16),
                          color: TColor.gray,
                          child: const SizedBox(height: 0)),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: TColor.gray),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
