import 'package:flutter/material.dart';

import 'constants.dart';

class TopTileLayout extends StatelessWidget {
  TopTileLayout({required this.selectedIcon, required this.selectedText});
  final IconData selectedIcon;
  final String selectedText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          selectedIcon,
          size: 80,
          color: kTileContentColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          selectedText,
          style: kTileDescriptionStyle,
        )
      ],
    );
  }
}
