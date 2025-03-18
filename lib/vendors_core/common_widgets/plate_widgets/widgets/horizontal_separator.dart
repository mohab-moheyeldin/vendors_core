import 'package:flutter/material.dart';
import 'package:vendors_core/vendors_core/utility/dimensions_utility/dimensions_utility.dart';

class HorizontalSeparator extends StatelessWidget {
  const HorizontalSeparator({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    int count = 2;
    final headerWidth = width.sp * 0.1951219512;
    final cellWidth = (width.sp - 2 - headerWidth) / count;
    return Container(
      height: 0,
      width: cellWidth,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
