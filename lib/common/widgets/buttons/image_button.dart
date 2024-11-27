import 'package:flutter/material.dart';

import '../../color_extension.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final VoidCallback onPressed;
  const ImageButton({super.key, required this.image, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: TColor.gray60.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: TColor.border.withOpacity(0.2),
          ),
        ),
        child: Image.asset(image, width: 50, height: 50, color: TColor.gray70),
      ),
    );
  }
}
