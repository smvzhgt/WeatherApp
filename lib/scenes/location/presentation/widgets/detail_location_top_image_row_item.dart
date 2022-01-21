import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/image_assets_path.dart';
import '../../../../core/widgets/svg_picture_wrapper.dart';

class DetailLocationTopImageRowItem extends StatelessWidget {
  final Size size;
  final String imageName;
  final String stateName;

  const DetailLocationTopImageRowItem({
    Key? key,
    required this.size,
    required this.imageName,
    required this.stateName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = size.width * 0.15;

    return Container(
      padding: const EdgeInsets.only(top: kAppWidgetPadding),
      margin: const EdgeInsets.only(
          left: kAppWidgetPadding, right: kAppWidgetPadding),
      width: double.infinity,
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
      child: Column(
        children: [
          SVGPictureWrapper().assets(
            getImagePath(imageName),
            _size,
            _size,
          ),
          const SizedBox(height: kSizedBoxHeightMedium),
          Text(
            stateName,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).focusColor,
            ),
          ),
        ],
      ),
    );
  }
}
