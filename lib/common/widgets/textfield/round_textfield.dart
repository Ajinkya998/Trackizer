import 'package:flutter/material.dart';

import '../../color_extension.dart';

class RoundTextfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obsureText;
  final TextAlign titleAlign;
  const RoundTextfield(
      {super.key,
      required this.title,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obsureText = false,
      this.titleAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(title,
                  textAlign: titleAlign,
                  style: TextStyle(color: TColor.gray50, fontSize: 12)),
            )
          ],
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 48,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: TColor.gray60.withOpacity(0.05),
              border: Border.all(color: TColor.gray70),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            obscureText: obsureText,
            controller: controller,
            keyboardType: keyboardType,
            decoration: const InputDecoration(
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
