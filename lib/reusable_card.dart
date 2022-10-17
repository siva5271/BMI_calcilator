import 'package:flutter/material.dart';

const tileMargin = 15.0;

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.selectedColour = const Color(0xFF1D1E33),
      required this.cardChild,
      required this.onClick});

  final Color selectedColour;
  final Widget cardChild;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: selectedColour),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}
