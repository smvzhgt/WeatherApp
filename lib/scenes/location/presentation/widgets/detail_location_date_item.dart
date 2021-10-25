import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class DetailLocationDateItem extends StatelessWidget {
  final double containerHeight;
  final String text;
  const DetailLocationDateItem({
    Key? key,
    required this.containerHeight,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
          left: kAppWidgetPadding, right: kAppWidgetPadding),
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
      height: containerHeight,
      width: double.infinity,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
