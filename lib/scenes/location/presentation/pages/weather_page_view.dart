import 'package:flutter/material.dart';
import 'package:forecastapp/core/constants.dart';

import '../../domain/entities/weather_entity.dart';
import 'weather_page.dart';

class WeatherPageView extends StatefulWidget {
  final List<WeatherEntity> entities;
  const WeatherPageView({
    Key? key,
    required this.entities,
  }) : super(key: key);

  @override
  _WeatherPageViewState createState() => _WeatherPageViewState();
}

class _WeatherPageViewState extends State<WeatherPageView> {
  late PageController _controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PageView _pageView = PageView.builder(
      itemBuilder: (context, index) {
        return WeatherPage(entity: widget.entities[index]);
      },
      itemCount: widget.entities.length,
      controller: _controller,
      onPageChanged: (int index) {
        setState(() => currentPage = index);
      },
    );

    return Padding(
      padding: const EdgeInsets.all(kAppPadding),
      child: Column(
        children: [
          Expanded(child: _pageView),
          Container(
            margin: const EdgeInsets.all(kAppWidgetPaddingSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.entities.length; i++)
                  (i == currentPage) ? indicatorActive() : indicatorInActive()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget indicatorActive() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: kAppWidgetPadding),
      height: kIndicatorHeight,
      width: kIndicatorWidth,
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius:
            const BorderRadius.all(Radius.circular(kIndicatorBorderRadius)),
      ),
    );
  }

  Widget indicatorInActive() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: kAppWidgetPadding),
      height: kIndicatorHeight,
      width: kIndicatorWidth,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(kIndicatorBorderRadius)),
      ),
    );
  }
}
