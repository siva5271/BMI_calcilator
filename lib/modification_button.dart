import 'package:flutter/material.dart';

import 'constants.dart';

class ModificationButton extends StatelessWidget {
  ModificationButton(
      {required this.modificationVariable, required this.onChange()});
  final modificationVariable;
  final void Function() onChange;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(50, 50),
          shape: const CircleBorder(),
          backgroundColor: kButtonBackgroundColor),
      onPressed: onChange,
      child: Icon(
        modificationVariable == kModificationVariable.add
            ? Icons.add
            : Icons.remove,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
