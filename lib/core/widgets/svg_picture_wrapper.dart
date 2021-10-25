import 'dart:ui';

import 'package:flutter_svg/svg.dart';

class SVGPictureWrapper {
  SvgPicture assets(String name, double height, double width, {Color? color}) {
    return SvgPicture.asset(
      name,
      height: height,
      width: width,
      color: color,
    );
  }
}
