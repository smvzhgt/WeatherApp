import 'package:flutter/material.dart';
import 'package:forecastapp/core/constants.dart';

import '../../../../core/widgets/svg_picture_wrapper.dart';

class DetailLocationWindRowItem extends StatelessWidget {
  final Size size;
  final double angle;
  final String text;

  const DetailLocationWindRowItem({
    Key? key,
    required this.size,
    required this.angle,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imageSize = size.width * 0.1;
    final _rowHeight = size.width * 0.15;

    return Container(
      margin: const EdgeInsets.only(
        left: kAppWidgetPadding,
        right: kAppWidgetPadding,
      ),
      padding: const EdgeInsets.only(left: kAppWidgetPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(kDetailRowContainerRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500.withOpacity(0.7),
            offset: const Offset(1.0, 1.0),
            blurRadius: kDetailRowContainerBlurRadius,
          ),
        ],
      ),
      height: _rowHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SVGPictureWrapper().assets(
            kImagePathWind,
            _imageSize,
            _imageSize,
          ),
          const SizedBox(width: kSizedBoxHeightBig),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: kSizedBoxHeightBig),
        ],
      ),
    );
  }
}
