import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/widgets/svg_picture_wrapper.dart';

class DetailLocationRowItem extends StatelessWidget {
  final double containerHeight;
  final double imageHeight;
  final double imageWidth;
  final String imageName;
  final String text;

  const DetailLocationRowItem({
    Key? key,
    required this.containerHeight,
    required this.imageHeight,
    required this.imageWidth,
    required this.imageName,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: kAppWidgetPadding,
        right: kAppWidgetPadding,
      ),
      padding: const EdgeInsets.only(left: kAppWidgetPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: Theme.of(context).cardColor),
        borderRadius: BorderRadius.circular(kDetailRowContainerRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500.withOpacity(0.7),
            offset: const Offset(1.0, 1.0),
            blurRadius: kDetailRowContainerBlurRadius,
          ),
        ],
      ),
      height: containerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SVGPictureWrapper().assets(
            imageName,
            imageHeight,
            imageWidth,
            color: Theme.of(context).focusColor
          ),
          const SizedBox(width: kSizedBoxHeightBig),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).focusColor,
            ),
          ),
        ],
      ),
    );
  }
}
