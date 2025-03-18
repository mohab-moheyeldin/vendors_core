import 'package:flutter/material.dart';

import '../widgets/plate_header_widget.dart';
import '../widgets/structure_number_widget.dart';
import '../widgets/vertical_separator.dart';

class ThailandPlateWidget extends StatelessWidget {
  const ThailandPlateWidget({
    super.key,
    required this.headerWidth,
    required this.height,
    required this.extraHeight,
    required this.structureNumber,
    required this.plateHeaderTextSize,
    required this.plateHeaderTextColor,
    required this.plateTextSize,
    required this.plateTextColor,
  });

  final double height;
  final double extraHeight;
  final double headerWidth;

  final String structureNumber;

  final double plateHeaderTextSize;
  final Color plateHeaderTextColor;
  final double plateTextSize;
  final Color plateTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: headerWidth,
          color: Colors.amber,
          child: PlateHeaderWidget(
            textSize: plateHeaderTextSize,
            textColor: plateHeaderTextColor,
            countryHeader: 'THI',
          ),
        ),
        VerticalSeparator(height: height, extraHeight: extraHeight),
        Expanded(
          child: StructureNumberWidget(
            structureNumber: structureNumber,
            textColor: plateTextColor,
            textSize: plateTextSize,
          ),
        ),
      ],
    );
  }
}
