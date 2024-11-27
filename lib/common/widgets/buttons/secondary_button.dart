import 'package:flutter/material.dart';

import '../../color_extension.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double fontSize;
  final FontWeight fontWeight;
  const SecondaryButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/secodry_btn.png"),
          ),
        ),
        child: Text(title,
            style: TextStyle(
                color: TColor.white,
                fontSize: fontSize,
                fontWeight: fontWeight)),
      ),
    );
  }
}
