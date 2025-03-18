import 'package:flutter/material.dart';

class DimensionsUtility {
  static get deviceFullHeight =>
      (WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height /
          WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio);

  static get deviceFullWidth =>
      (WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width /
          WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio);

  static get aspectRatio => deviceFullWidth * 0.00277;
}

extension FancyNum on num {
  double get sp => (this * DimensionsUtility.aspectRatio).toDouble();
}
