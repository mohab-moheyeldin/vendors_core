import 'package:flutter/material.dart';
import 'package:vendors_core/vendors_core/utility/dimensions_utility/dimensions_utility.dart';

class VerticalSeparator extends StatelessWidget {
  const VerticalSeparator({
    super.key,
    required this.height,
    required this.extraHeight,
  });

  final double height;
  final double extraHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.sp + extraHeight.sp,
      width: 0,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 1.sp,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
