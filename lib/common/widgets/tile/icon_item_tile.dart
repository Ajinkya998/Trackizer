import 'package:flutter/cupertino.dart';

import '../../color_extension.dart';

class IconItemTile extends StatelessWidget {
  final String title, value, icon;
  const IconItemTile(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Image.asset(icon, width: 20, height: 20),
          const SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
                color: TColor.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: TColor.gray30,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            "assets/images/next.png",
            width: 12,
            height: 12,
            color: TColor.gray30,
          ),
        ],
      ),
    );
  }
}

class IconItemSwitchTile extends StatelessWidget {
  final String title, icon;
  final bool value;
  final Function(bool) didChange;
  const IconItemSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.didChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Image.asset(icon, width: 20, height: 20),
          const SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
                color: TColor.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          CupertinoSwitch(value: value, onChanged: didChange),
        ],
      ),
    );
  }
}
