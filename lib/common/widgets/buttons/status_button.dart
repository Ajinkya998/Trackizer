import 'package:flutter/material.dart';

import '../../color_extension.dart';

class StatusButton extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onPressed;
  final Color statusColor;
  const StatusButton(
      {super.key,
      required this.title,
      required this.value,
      required this.onPressed,
      required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 68,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TColor.gray60.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: TColor.border.withOpacity(0.15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: TextStyle(
                      color: TColor.gray30,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
                Text(value,
                    style: TextStyle(
                      color: TColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 1,
            alignment: Alignment.topCenter,
            color: statusColor,
          ),
        ],
      ),
    );
  }
}
