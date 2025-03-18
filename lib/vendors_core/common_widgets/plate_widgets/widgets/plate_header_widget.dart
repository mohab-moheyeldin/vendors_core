import 'package:flutter/material.dart';
import 'package:vendors_core/vendors_core/utility/dimensions_utility/dimensions_utility.dart';

class PlateHeaderWidget extends StatelessWidget {
  const PlateHeaderWidget({
    super.key,
    required this.textSize,
    required this.textColor,
    required this.countryHeader,
  });

  final double textSize;
  final Color textColor;
  final String countryHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: countryHeader
          .split('')
          .map((e) => Center(
                child: Text(
                  e,
                  style: TextStyle(
                    color: textColor,
                    fontSize: textSize.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.sp,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
