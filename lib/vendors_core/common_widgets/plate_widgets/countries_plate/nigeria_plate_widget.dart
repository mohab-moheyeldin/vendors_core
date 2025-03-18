import 'package:flutter/material.dart';

import '../../../constants/images_constants.dart';
import '../widgets/structure_number_widget.dart';

class NigeriaPlateWidget extends StatelessWidget {
  const NigeriaPlateWidget({
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
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            ImagesConstants.nigeriaPlateImg,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: StructureNumberWidget(
            structureNumber: structureNumber,
            textSize: textSize,
            textColor: textColor,
          ),
        )
      ],
    );
  }
}
