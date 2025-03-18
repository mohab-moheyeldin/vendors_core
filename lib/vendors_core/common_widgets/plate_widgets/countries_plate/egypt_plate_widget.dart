import 'package:flutter/material.dart';
import 'package:vendors_core/vendors_core/utility/dimensions_utility/dimensions_utility.dart';

import '../widgets/plate_cell.dart';
import '../widgets/structure_number_widget.dart';
import '../widgets/vertical_separator.dart';

class EgyptPlateWidget extends StatelessWidget {
  const EgyptPlateWidget({
    super.key,
    required this.height,
    required this.extraHeight,
    required this.width,
    required this.lettersAr,
    required this.numbersAr,
    required this.hasStructureNumber,
    this.structureNumber,
    required this.plateHeaderTextSize,
    required this.plateHeaderTextColor,
    required this.plateTextSize,
    required this.plateTextColor,
  });

  final double height;
  final double extraHeight;
  final double width;

  final String lettersAr;
  final String numbersAr;
  final bool hasStructureNumber;
  final String? structureNumber;

  final double plateHeaderTextSize;
  final Color plateHeaderTextColor;
  final double plateTextSize;
  final Color plateTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.amber,
            child: PlateEgHeaderWidget(
              headerTextStyle: TextStyle(
                color: plateHeaderTextColor,
                fontSize: plateHeaderTextSize,
                fontWeight: FontWeight.bold,
                height: 1.sp,
              ),
            ),
          ),
        ),
        Container(
          height: 0,
          width: width.sp + 1.sp,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
        hasStructureNumber
            ? Expanded(
                child: StructureNumberWidget(
                  structureNumber: structureNumber ?? '',
                  textSize: plateTextSize,
                  textColor: plateTextColor,
                ),
              )
            : Expanded(
                child: EgyptPlateNumberWidget(
                  width: width,
                  height: height,
                  extraHeight: extraHeight,
                  lettersAr: lettersAr,
                  numbersAr: numbersAr,
                  textColor: plateTextColor,
                  textSize: plateTextSize,
                ),
              )
      ],
    );
  }
}

class EgyptPlateNumberWidget extends StatelessWidget {
  const EgyptPlateNumberWidget({
    super.key,
    required this.width,
    required this.height,
    required this.extraHeight,
    required this.lettersAr,
    required this.numbersAr,
    required this.textSize,
    required this.textColor,
  });

  final double width;
  final double height;
  final double extraHeight;

  final String lettersAr;
  final String numbersAr;
  final double textSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: PlateCell(
              width: width,
              height: height,
              extraHeight: extraHeight,
              text: lettersAr,
              textColor: textColor,
              textSize: textSize,
            ),
          ),
        ),
        VerticalSeparator(height: height, extraHeight: extraHeight),
        Expanded(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: PlateCell(
              width: width,
              height: height,
              extraHeight: extraHeight,
              text: numbersAr,
              textColor: textColor,
              textSize: textSize,
            ),
          ),
        ),
      ],
    );
  }
}

class PlateEgHeaderWidget extends StatelessWidget {
  const PlateEgHeaderWidget({
    super.key,
    required this.headerTextStyle,
  });

  final TextStyle headerTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "مصر",
              style: headerTextStyle,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "Egypt",
              style: headerTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
