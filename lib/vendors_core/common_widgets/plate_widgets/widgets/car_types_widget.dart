import 'package:flutter/material.dart';
import 'package:vendors_core/vendors_core/utility/dimensions_utility/dimensions_utility.dart';

///Found on the old implementation
///Kept for reference or new updates
///it should depends on carType as int
///but carType maybe string like 'خصوصي'

Map<dynamic, Widget> mapWidgetWithCarTypeId = {
  1: const MyCircle(),
  2: const MyTriangle(direction: "down"),
  3: const MyTriangle(direction: "up"),
  4: const MyTriangle(direction: "down"),
  5: const MyTriangle(direction: "down"),
  6: const MyTriangle(direction: "down"),
  7: const MyCircle(),
  8: const MyCircle(),
  9: const MyTriangle(direction: "down")
};

class TrianglePainter extends CustomPainter {
  final String direction;

  TrianglePainter({required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    if (direction == "up") {
      // triangle point upwards
      path.moveTo(size.width / 2, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
    } else {
      // triangle point downwards
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width / 2, size.height);
    }

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) => false;
}

class MyTriangle extends StatelessWidget {
  final String direction;

  const MyTriangle({super.key, required this.direction});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePainter(direction: direction),
      size: Size(5.sp, 5.sp),
    );
  }
}

class MyCircle extends StatelessWidget {
  const MyCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.sp,
      width: 5.sp,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50.sp),
      ),
    );
  }
}
