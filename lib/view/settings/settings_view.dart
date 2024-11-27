import 'package:flutter/material.dart';
import 'package:tackizer/common/widgets/tile/icon_item_tile.dart';

import '../../common/color_extension.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
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
                        "Settings",
                        style: TextStyle(fontSize: 16, color: TColor.gray30),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/u1.png", width: 70, height: 70),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ajinkya",
                    style: TextStyle(
                      fontSize: 20,
                      color: TColor.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ajinkya@gmail.com",
                    style: TextStyle(
                      fontSize: 12,
                      color: TColor.gray30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: TColor.gray60.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: TColor.border.withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: TColor.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 8),
                      child: Text(
                        "General",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: TColor.gray60.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const IconItemTile(
                              title: "Security",
                              value: "Face ID",
                              icon: "assets/images/face_id.png"),
                          IconItemSwitchTile(
                            title: "iClound",
                            value: isActive,
                            icon: "assets/images/icloud.png",
                            didChange: (newValue) {
                              setState(() {
                                isActive = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 8),
                      child: Text(
                        "My Subscription",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: TColor.gray60.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Column(
                        children: [
                          IconItemTile(
                              title: "Sorting",
                              value: "Date",
                              icon: "assets/images/sorting.png"),
                          IconItemTile(
                              title: "Summary",
                              value: "Average",
                              icon: "assets/images/chart.png"),
                          IconItemTile(
                              title: "Default Currency",
                              value: "USD (\$)",
                              icon: "assets/images/money.png"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 8),
                      child: Text(
                        "Appearance",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: TColor.gray60.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Column(
                        children: [
                          IconItemTile(
                              title: "App Icon",
                              value: "Default",
                              icon: "assets/images/app_icon.png"),
                          IconItemTile(
                              title: "Theme",
                              value: "Dark",
                              icon: "assets/images/light_theme.png"),
                          IconItemTile(
                              title: "Font",
                              value: "Inter",
                              icon: "assets/images/font.png"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
