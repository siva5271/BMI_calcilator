import 'package:flutter/material.dart';

import 'constants.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({required this.description, required this.uponClick});
  final description;
  final void Function() uponClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: uponClick,
      child: Container(
        child: Center(
          child: Text(
            description,
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: kActiveCardColor),
          ),
        ),
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: kBottomContainerTopMargin),
        width: double.infinity,
        color: kBottomContainerColor,
      ),
    );
  }
}
