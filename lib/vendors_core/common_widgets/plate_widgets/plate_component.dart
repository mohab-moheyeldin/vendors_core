import 'package:flutter/material.dart';
import 'package:vendors_core/vendors_core/utility/dimensions_utility/dimensions_utility.dart';

import 'countries_plate/egypt_plate_widget.dart';
import 'countries_plate/ksa_plate_widget.dart';
import 'countries_plate/nigeria_plate_widget.dart';
import 'countries_plate/thailand_plate_widget.dart';

const headerWidthRatio = 0.1951219512;

class PlateComponent extends StatefulWidget {
  final String? lettersAr;
  final String? lettersEn;
  final String? numbersAr;
  final String? numbersEn;
  final String? structureNo;

  final double width;
  final double height;
  final double extraHeight;
  final double headerTextSize;
  final double textSize;
  final Color textColor;

  final String country;

  const PlateComponent({
    super.key,
    required this.lettersAr,
    required this.lettersEn,
    required this.numbersAr,
    required this.numbersEn,
    this.width = 100,
    this.height = 50,
    this.textSize = 9,
    this.headerTextSize = 9,
    this.extraHeight = 5,
    this.textColor = Colors.black,
    this.structureNo, required this.country,
  });

  @override
  State<PlateComponent> createState() => _PlateComponentState();
}

class _PlateComponentState extends State<PlateComponent> {
  String country = 'sa';
  bool hasStructureNumber = false;
  double headerWidth = 0;

  @override
  void initState() {
    super.initState();
    country = widget.country;
    hasStructureNumber = widget.structureNo != null && widget.structureNo != '';
    headerWidth = widget.width.sp * headerWidthRatio;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width.sp + 1.sp,
          height: widget.height.sp + widget.extraHeight.sp,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              width: 1.sp,
              color: Colors.black,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: PlateWidget(
                country: country,
                width: widget.width,
                headerWidth: headerWidth,
                height: widget.height,
                extraHeight: widget.extraHeight,
                headerTextSize: widget.headerTextSize,
                textSize: widget.textSize,
                textColor: widget.textColor,
                hasStructureNumber: hasStructureNumber,
                lettersAr: widget.lettersAr,
                lettersEn: widget.lettersEn,
                numbersAr: widget.numbersAr,
                numbersEn: widget.numbersEn,
                structureNo: widget.structureNo,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PlateWidget extends StatelessWidget {
  const PlateWidget({
    super.key,
    required this.country,
    this.lettersAr,
    this.lettersEn,
    this.numbersAr,
    this.numbersEn,
    this.structureNo,
    required this.width,
    required this.height,
    required this.extraHeight,
    required this.headerTextSize,
    required this.textSize,
    required this.textColor,
    required this.headerWidth,
    required this.hasStructureNumber,
  });

  final String country;
  final String? lettersAr;
  final String? lettersEn;
  final String? numbersAr;
  final String? numbersEn;
  final String? structureNo;
  final bool hasStructureNumber;

  final double height;
  final double extraHeight;
  final double width;
  final double headerWidth;
  final double headerTextSize;
  final double textSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    switch (country) {
      case 'ng':
        return NigeriaPlateWidget(
          structureNumber: structureNo ?? '',
          textSize: textSize,
          textColor: textColor,
        );
      case 'th':
        return ThailandPlateWidget(
          headerWidth: headerWidth,
          height: height,
          extraHeight: extraHeight,
          plateHeaderTextSize: headerTextSize,
          plateHeaderTextColor: Colors.black,
          plateTextColor: textColor,
          plateTextSize: textSize,
          structureNumber: structureNo ?? '',
        );
      case 'eg':
        return EgyptPlateWidget(
          height: height,
          extraHeight: extraHeight,
          width: width,
          lettersAr: lettersAr ?? '',
          numbersAr: numbersAr ?? '',
          hasStructureNumber: hasStructureNumber,
          structureNumber: structureNo ?? '',
          plateHeaderTextColor: Colors.black,
          plateHeaderTextSize: headerTextSize,
          plateTextSize: textSize,
          plateTextColor: textColor,
        );
      default:
        return KSAPlateWidget(
          headerWidth: headerWidth,
          hasStructureNumber: hasStructureNumber,
          structureNumber: structureNo ?? '',
          height: height,
          extraHeight: extraHeight,
          width: width,
          lettersAr: lettersAr ?? '',
          lettersEn: lettersEn ?? '',
          numbersAr: numbersAr ?? '',
          numbersEn: numbersEn ?? '',
          plateHeaderTextSize: headerTextSize,
          plateHeaderTextColor: Colors.black,
          plateTextColor: textColor,
          plateTextSize: textSize,
        );
    }
  }
}
