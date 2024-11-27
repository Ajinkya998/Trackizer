import 'package:flutter/material.dart';

import '../../color_extension.dart';

class BudgetsTile extends StatelessWidget {
  final Map bObj;
  final VoidCallback onPressed;
  const BudgetsTile({super.key, required this.bObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double proVal = (double.tryParse(bObj["spend_amount"]) ?? 0) /
        (double.tryParse(bObj["total_amount"]) ?? 0);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: TColor.border.withOpacity(0.05),
          ),
          color: TColor.gray60.withOpacity(0.1),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(bObj["icon"],
                      width: 30, height: 30, color: TColor.gray30),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bObj["name"],
                        style: TextStyle(
                            color: TColor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$${bObj["left_amount"]} left to spend",
                        style: TextStyle(
                            color: TColor.gray30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${bObj["spend_amount"]}",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "of \$${bObj["total_amount"]}",
                      style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              backgroundColor: TColor.gray60,
              valueColor: AlwaysStoppedAnimation(bObj["color"]),
              minHeight: 3,
              value: proVal,
            ),
          ],
        ),
      ),
    );
  }
}
