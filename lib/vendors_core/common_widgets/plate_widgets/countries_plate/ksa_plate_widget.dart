import 'package:flutter/material.dart';

import '../widgets/horizontal_separator.dart';
import '../widgets/plate_cell.dart';
import '../widgets/plate_header_widget.dart';
import '../widgets/structure_number_widget.dart';
import '../widgets/vertical_separator.dart';

class KSAPlateWidget extends StatelessWidget {
  const KSAPlateWidget({
    super.key,
    required this.height,
    required this.extraHeight,
    required this.width,
    required this.headerWidth,
    required this.lettersAr,
    required this.lettersEn,
    required this.numbersAr,
    required this.numbersEn,
    required this.plateHeaderTextSize,
    required this.plateHeaderTextColor,
    required this.plateTextSize,
    required this.plateTextColor,
    required this.hasStructureNumber,
    this.structureNumber,
  });
  final double height;
  final double extraHeight;
  final double width;
  final double headerWidth;

  final String lettersAr;
  final String lettersEn;
  final String numbersAr;
  final String numbersEn;
  final bool hasStructureNumber;
  final String? structureNumber;

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
            countryHeader: 'KSA',
          ),
        ),
        VerticalSeparator(
          extraHeight: extraHeight,
          height: height,
        ),
        hasStructureNumber
            ? Expanded(
                child: StructureNumberWidget(
                  structureNumber: structureNumber ?? '',
                  textSize: plateTextSize,
                  textColor: plateTextColor,
                ),
              )
            : KSAPlateNumberWidget(
                width: width,
                height: height,
                extraHeight: extraHeight,
                lettersAr: lettersAr,
                lettersEn: lettersEn,
                numbersAr: numbersAr,
                numbersEn: numbersEn,
                textSize: plateTextSize,
                textColor: plateTextColor,
              ),
      ],
    );
  }
}

class KSAPlateNumberWidget extends StatelessWidget {
  const KSAPlateNumberWidget({
    super.key,
    required this.width,
    required this.height,
    required this.extraHeight,
    required this.lettersAr,
    required this.lettersEn,
    required this.numbersAr,
    required this.numbersEn,
    required this.textSize,
    required this.textColor,
  });

  final double width;
  final double height;
  final double extraHeight;
  final String lettersAr;
  final String lettersEn;
  final String numbersAr;
  final String numbersEn;

  final double textSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        children: [
          Directionality(
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
          HorizontalSeparator(width: width),
          Directionality(
            textDirection: TextDirection.ltr,
            child: PlateCell(
              width: width,
              height: height,
              extraHeight: extraHeight,
              text: lettersEn,
              textColor: textColor,
              textSize: textSize,
            ),
          ),
        ],
      ),
      VerticalSeparator(height: height, extraHeight: extraHeight),
      Column(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: PlateCell(
              width: width,
              height: height,
              extraHeight: extraHeight,
              text: numbersAr,
              textColor: textColor,
              textSize: textSize,
            ),
          ),
          HorizontalSeparator(width: width),
          Directionality(
            textDirection: TextDirection.ltr,
            child: PlateCell(
              width: width,
              height: height,
              extraHeight: extraHeight,
              text: numbersEn,
              textColor: textColor,
              textSize: textSize,
            ),
          ),
        ],
      ),
    ]);
  }
}
