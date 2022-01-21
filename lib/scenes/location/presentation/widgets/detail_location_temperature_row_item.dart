import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../generated/l10n.dart';

class DetailLocationTemperatureRowItem extends StatelessWidget {
  final Size size;
  final int minTemp;
  final int maxTemp;
  final int temp;

  const DetailLocationTemperatureRowItem({
    Key? key,
    required this.size,
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _rowHeight = size.width * 0.2;
    return Container(
      margin: const EdgeInsets.only(
        left: kAppWidgetPadding,
        right: kAppWidgetPadding,
      ),
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
      padding: const EdgeInsets.all(kAppWidgetPadding),
      height: _rowHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$temp \u2103',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).focusColor,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).temperature_max + "$maxTemp \u2103",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).focusColor,
                ),
              ),
              const SizedBox(width: 25),
              Text(
                S.of(context).temperature_min + "$minTemp \u2103",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).focusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
