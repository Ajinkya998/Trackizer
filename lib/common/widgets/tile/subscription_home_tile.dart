import 'package:flutter/material.dart';

import '../../color_extension.dart';

class SubscriptionHomeTile extends StatelessWidget {
  final Map sObj;
  final VoidCallback onPressed;
  const SubscriptionHomeTile(
      {super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: TColor.border.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            Image.asset(sObj["icon"], width: 40, height: 40),
            const SizedBox(width: 8),
            Expanded(
                child: Text(
              sObj["name"],
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )),
            Text(
              "\$${sObj["price"]}",
              style: TextStyle(
                  color: TColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
