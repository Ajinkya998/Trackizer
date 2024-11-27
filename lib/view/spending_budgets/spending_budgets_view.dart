import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tackizer/common/color_extension.dart';
import 'package:tackizer/common/widgets/custom_arc/custom_arc_180_painter.dart';
import 'package:tackizer/common/widgets/tile/budgets_tile.dart';
import 'package:tackizer/view/settings/settings_view.dart';

class SpendingBudgetsView extends StatefulWidget {
  const SpendingBudgetsView({super.key});

  @override
  State<SpendingBudgetsView> createState() => _SpendingBudgetsViewState();
}

class _SpendingBudgetsViewState extends State<SpendingBudgetsView> {
  List budgetList = [
    {
      "name": "Auto & Transport",
      "icon": "assets/images/auto_transport.png",
      "spend_amount": "225.99",
      "total_amount": "400",
      "left_amount": "175.01",
      "color": TColor.secondaryG
    },
    {
      "name": "Entertainment",
      "icon": "assets/images/entertainment.png",
      "spend_amount": "250.99",
      "total_amount": "600",
      "left_amount": "350.01",
      "color": TColor.secondary50
    },
    {
      "name": "Security",
      "icon": "assets/images/security.png",
      "spend_amount": "455.99",
      "total_amount": "600",
      "left_amount": "145.01",
      "color": TColor.primary10
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
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Budgets",
                        style: TextStyle(color: TColor.gray30, fontSize: 16),
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
            const SizedBox(height: 15),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: media.width * 0.5,
                  height: media.width * 0.25,
                  child: CustomPaint(
                    painter: CustomArc180Painter(
                        end: 50,
                        bgWidth: 8,
                        width: 12,
                        drwArcs: [
                          ArcModel(color: TColor.secondaryG, value: 20),
                          ArcModel(color: TColor.secondary, value: 45),
                          ArcModel(color: TColor.primary10, value: 70),
                        ]),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "\$82.90",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "of \$2,000 budget",
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: TColor.border.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your budget are on track 👍",
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: budgetList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                var bObj = budgetList[index] as Map? ?? {};
                return BudgetsTile(bObj: bObj, onPressed: () {});
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add new category ",
                          style: TextStyle(
                              color: TColor.gray30,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Image.asset("assets/images/add.png",
                            width: 12, height: 12, color: TColor.gray30)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
