import 'package:flutter/material.dart';

import '../../color_extension.dart';

class SubscriptionCell extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;
  const SubscriptionCell(
      {super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: TColor.gray60.withOpacity(0.2),
          border: Border.all(
            color: TColor.border.withOpacity(0.1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(sObj["icon"], width: 45, height: 45),
            const Spacer(),
            Text(
              sObj["name"],
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "\$${sObj["price"]}",
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
