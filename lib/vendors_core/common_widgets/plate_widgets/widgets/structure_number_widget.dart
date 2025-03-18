import 'package:flutter/material.dart';
import 'package:vendors_core/vendors_core/utility/dimensions_utility/dimensions_utility.dart';

class StructureNumberWidget extends StatelessWidget {
  const StructureNumberWidget({
    super.key,
    required this.structureNumber,
    required this.textSize,
    required this.textColor,
  });
  final String structureNumber;
  final double textSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Text(
          structureNumber,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: textSize.sp,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
