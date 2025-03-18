import 'package:flutter/material.dart';
import 'package:vendors_core/vendors_core/utility/dimensions_utility/dimensions_utility.dart';

class PlateCell extends StatelessWidget {
  const PlateCell({
    super.key,
    required this.width,
    required this.height,
    required this.extraHeight,
    required this.text,
    required this.textColor,
    required this.textSize,
  });
  final double width;
  final double height;
  final double extraHeight;
  final String text;
  final Color textColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    int count = 2;
    final headerWidth = width.sp * 0.1951219512;
    final cellWidth = (width.sp - 2 - headerWidth) / count;
    final cellHeight = (height.sp + extraHeight.sp - 3) / 2;
    return SizedBox(
      width: cellWidth,
      height: cellHeight,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: textSize.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Alexandria'
              // letterSpacing: 2,
              ),
        ),
      ),
    );
  }
}
